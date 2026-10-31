import AppKit
import Combine
import SwiftUI

/// App state: what each control does per layer (the keypad can't be read back, so this is the
/// source of truth), the live keypad state and the connection to the device.
final class AppModel: ObservableObject {
    struct Toast: Equatable {
        let text: String
        let isError: Bool
        let id = UUID()
    }

    struct LogEntry: Identifiable {
        let id = UUID()
        let control: Control?
        let text: String
    }

    static let layerCount = 3

    @Published private(set) var layers: [LayerConfig]
    @Published private(set) var activeLayer: Int
    @Published private(set) var ledMode: LEDMode?
    /// Light settings for the MiniKeys firmware.
    @Published private(set) var lightSettings: LightSettings
    /// Turns the light off while the Mac is locked or its display sleeps, and back on afterwards.
    @Published var dimsWhenLocked: Bool {
        didSet { defaults.set(dimsWhenLocked, forKey: Keys.dimsWhenLocked) }
    }
    /// Light state forced live (not saved on the keypad); `nil` while it shows its saved mode.
    @Published private(set) var liveLightOn: Bool?
    @Published var selected: Control = .key1
    @Published private(set) var pressed: Set<Control> = []
    @Published private(set) var knobAngle: Double = 0
    /// Last key the keypad lit up in "on press" mode; turning the knob lights key 3.
    @Published private(set) var lastFlash: (key: Control, date: Date, count: Int)?
    @Published private(set) var log: [LogEntry] = []
    @Published private(set) var toast: Toast?

    let device = KeyboardDevice()
    let input = InputMonitor()

    private var cancellables = Set<AnyCancellable>()
    private let defaults = UserDefaults.standard

    private enum Keys {
        static let layers = "layers"
        static let activeLayer = "activeLayer"
        static let ledMode = "ledMode"
        static let dimsWhenLocked = "dimsWhenLocked"
        static let lightSettings = "lightSettings"
    }

    private var lightSendPending = false
    private var clockSyncWork: DispatchWorkItem?
    /// When the keypad's light effect last restarted; the preview animates from the same moment.
    private(set) var lightEpoch = Date()
    private var lightSaveWork: DispatchWorkItem?

    init() {
        if let data = defaults.data(forKey: Keys.layers),
           let stored = try? JSONDecoder().decode([LayerConfig].self, from: data),
           stored.count == Self.layerCount {
            layers = stored
        } else {
            layers = Array(repeating: [:], count: Self.layerCount)
        }
        activeLayer = min(max(defaults.integer(forKey: Keys.activeLayer), 0), Self.layerCount - 1)
        ledMode = defaults.object(forKey: Keys.ledMode) == nil ? nil : LEDMode(rawValue: defaults.integer(forKey: Keys.ledMode))
        dimsWhenLocked = defaults.object(forKey: Keys.dimsWhenLocked) as? Bool ?? true
        lightSettings = defaults.data(forKey: Keys.lightSettings)
            .flatMap { try? JSONDecoder().decode(LightSettings.self, from: $0) } ?? LightSettings()

        device.objectWillChange.sink { [weak self] in self?.objectWillChange.send() }.store(in: &cancellables)
        input.objectWillChange.sink { [weak self] in self?.objectWillChange.send() }.store(in: &cancellables)
        input.onEvent = { [weak self] in self?.handle($0) }
        input.start()

        // The MiniKeys firmware only writes flash bytes that change, so syncing on every connection
        // is cheap and keeps the keypad matching the app.
        device.$firmwareVersion
            .removeDuplicates()
            .filter { $0 != nil }
            .sink { [weak self] _ in self?.syncFirmware() }
            .store(in: &cancellables)

        let distributed = DistributedNotificationCenter.default()
        let workspace = NSWorkspace.shared.notificationCenter
        for (center, name) in [
            (distributed, Notification.Name("com.apple.screenIsLocked")),
            (workspace, NSWorkspace.screensDidSleepNotification)
        ] {
            center.addObserver(forName: name, object: nil, queue: .main) { [weak self] _ in self?.macWentAway() }
        }
        for (center, name) in [
            (distributed, Notification.Name("com.apple.screenIsUnlocked")),
            (workspace, NSWorkspace.screensDidWakeNotification)
        ] {
            center.addObserver(forName: name, object: nil, queue: .main) { [weak self] _ in self?.restoreLight() }
        }
        NotificationCenter.default.addObserver(
            forName: NSApplication.willTerminateNotification, object: nil, queue: .main
        ) { [weak self] _ in
            self?.restoreLightBeforeQuitting()
        }
    }

    var config: LayerConfig { layers[activeLayer] }

    func action(for control: Control) -> Action? { config[control] }

    // MARK: - Editing

    func setAction(_ action: Action, for control: Control) {
        layers[activeLayer][control] = action
        save()
        write(KeypadProtocol.bind(action, to: control, layer: activeLayer + 1), success: "\(control.title): \(action.label)")
    }

    func applyPreset(_ preset: Preset) {
        layers[activeLayer] = preset.config
        save()
        let packets = Control.allCases.flatMap { control in
            preset.config[control].map { KeypadProtocol.bind($0, to: control, layer: activeLayer + 1) } ?? []
        }
        write(packets, success: "“\(preset.title)” preset saved to the keypad")
    }

    /// Writes every known binding of the current layer again (e.g. after the keypad was reset elsewhere).
    func writeAll() {
        let packets = Control.allCases.flatMap { control in
            config[control].map { KeypadProtocol.bind($0, to: control, layer: activeLayer + 1) } ?? []
        }
        guard !packets.isEmpty else {
            showToast("This layer has no keys set up yet", isError: true)
            return
        }
        write(packets, success: "Layer \(activeLayer + 1) written to the keypad")
    }

    func setLEDMode(_ mode: LEDMode) {
        ledMode = mode
        defaults.set(mode.rawValue, forKey: Keys.ledMode)
        write(KeypadProtocol.setLED(mode, layer: activeLayer + 1), success: "Light: \(mode.title)")
    }

    func activateLayer(_ layer: Int) {
        guard (0..<Self.layerCount).contains(layer) else { return }
        activeLayer = layer
        defaults.set(layer, forKey: Keys.activeLayer)
        let packets = device.hasMiniKeysFirmware
            ? KeypadProtocol.selectLayerOnly(layer + 1)
            : KeypadProtocol.activateLayer(layer + 1, config: layers[layer])
        write(packets, success: "Layer \(layer + 1) active")
    }

    // MARK: - MiniKeys firmware

    /// Writes every layer's keys and the light settings, then selects the active layer.
    private func syncFirmware() {
        var quiet = lightSettings
        quiet.flashesLayer = false                // no layer blinks while each layer is written
        var packets = KeypadProtocol.light(quiet)
        for layer in 0..<Self.layerCount {
            for control in Control.allCases {
                if let action = layers[layer][control] {
                    packets += KeypadProtocol.bind(action, to: control, layer: layer + 1)
                }
            }
        }
        packets += KeypadProtocol.light(lightSettings) + [KeypadProtocol.saveLight]
        packets += KeypadProtocol.selectLayerOnly(activeLayer + 1)
        write(packets, success: "Keypad synced with MiniKeys")
        scheduleLightClockSync()
    }

    /// Restarts the effect on the keypad and in the preview at the same moment. It runs a moment
    /// after the last light change, once the keypad has applied (and saved) it.
    private func scheduleLightClockSync() {
        clockSyncWork?.cancel()
        let work = DispatchWorkItem { [weak self] in
            self?.device.send([KeypadProtocol.syncLightClock]) { result in
                if case .success = result { self?.lightEpoch = Date() }
            }
        }
        clockSyncWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: work)
    }

    // MARK: - MiniKeys firmware light

    /// Shows the change on the keypad right away and saves it once the edits settle.
    func updateLight(_ change: (inout LightSettings) -> Void) {
        change(&lightSettings)
        if let data = try? JSONEncoder().encode(lightSettings) {
            defaults.set(data, forKey: Keys.lightSettings)
        }
        // Sliders change many times per second: send at most one update per 50 ms.
        if !lightSendPending {
            lightSendPending = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
                guard let self else { return }
                lightSendPending = false
                device.send(KeypadProtocol.light(lightSettings))
                scheduleLightClockSync()
            }
        }
        // Saving writes the keypad's flash, so wait until the edits stop.
        lightSaveWork?.cancel()
        let work = DispatchWorkItem { [weak self] in
            guard let self else { return }
            write(KeypadProtocol.light(lightSettings) + [KeypadProtocol.saveLight], success: "Light saved on the keypad")
            scheduleLightClockSync()
        }
        lightSaveWork = work
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2, execute: work)
    }

    // MARK: - Live light

    /// Changes the light without saving it, so the keypad's memory isn't worn and the saved mode
    /// comes back on its own when it is plugged in again.
    private func macWentAway() {
        guard dimsWhenLocked, device.isConnected else { return }
        if device.hasMiniKeysFirmware {
            guard lightSettings.effect != .off else { return }
            liveLightOn = false
            device.send([KeypadProtocol.keyColor(0, RGB(r: 0, g: 0, b: 0))])
        } else {
            guard ledMode != .off else { return }
            liveLightOn = false
            device.send([KeypadProtocol.previewLED(.off, layer: activeLayer + 1)])
        }
    }

    private var restoreLightPacket: [UInt8] {
        device.hasMiniKeysFirmware
            ? KeypadProtocol.clearKeyColors
            : KeypadProtocol.previewLED(ledMode ?? .on, layer: activeLayer + 1)
    }

    private func restoreLight() {
        guard liveLightOn != nil else { return }
        liveLightOn = nil
        device.send([restoreLightPacket])
    }

    private func restoreLightBeforeQuitting() {
        guard liveLightOn != nil else { return }
        device.sendAndWait([restoreLightPacket])
    }

    private func save() {
        if let data = try? JSONEncoder().encode(layers) {
            defaults.set(data, forKey: Keys.layers)
        }
    }

    private func write(_ packets: [[UInt8]], success: String) {
        device.send(packets) { [weak self] result in
            switch result {
            case .success: self?.showToast(success, isError: false)
            case .failure(let error): self?.showToast(error.localizedDescription, isError: true)
            }
        }
    }

    private func showToast(_ text: String, isError: Bool) {
        let toast = Toast(text: text, isError: isError)
        withAnimation(.spring(response: 0.3)) { self.toast = toast }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard self?.toast == toast else { return }
            withAnimation(.easeOut(duration: 0.3)) { self?.toast = nil }
        }
    }

    // MARK: - Live input

    private enum Trigger: Hashable {
        case key(UInt8), consumer(UInt16), mouseButton(Int), wheel(up: Bool)
    }

    private func trigger(of action: Action) -> Trigger? {
        switch action {
        case .keys(let strokes):
            guard let first = strokes.first else { return nil }
            if first.key != 0 { return .key(first.key) }
            guard let bit = (0..<8).first(where: { first.modifiers.rawValue & (1 << $0) != 0 }) else { return nil }
            return .key(0xE0 + UInt8(bit))
        case .media(let media): return .consumer(media.rawValue)
        case .mouse(.leftClick): return .mouseButton(1)
        case .mouse(.rightClick): return .mouseButton(2)
        case .mouse(.middleClick): return .mouseButton(3)
        case .mouse(.scrollUp): return .wheel(up: true)
        case .mouse(.scrollDown): return .wheel(up: false)
        case .disabled: return nil
        }
    }

    private func handle(_ event: InputMonitor.Event) {
        let trigger: Trigger
        let isDown: Bool
        let fallback: String
        switch event {
        case .key(let usage, let down):
            trigger = .key(usage); isDown = down; fallback = KeyCatalog.name(usage: usage)
        case .consumer(let usage, let down):
            trigger = .consumer(usage); isDown = down
            fallback = MediaKey(rawValue: usage)?.title ?? String(format: "Media 0x%02X", usage)
        case .mouseButton(let button, let down):
            trigger = .mouseButton(button); isDown = down; fallback = "Mouse button \(button)"
        case .wheel(let up):
            trigger = .wheel(up: up); isDown = true; fallback = up ? "Scroll up" : "Scroll down"
        }

        let controls = Control.allCases.filter { control in
            config[control].flatMap { self.trigger(of: $0) } == trigger
        }
        // A combination arrives as a modifier followed by its key; only the key is worth reacting to.
        let isUnmatchedModifier: Bool = {
            if case .key(let usage) = trigger { return usage >= 0xE0 && controls.isEmpty }
            return false
        }()
        guard !isUnmatchedModifier else { return }

        if isDown {
            if let control = controls.first {
                let key: Control = [.key1, .key2, .key3].contains(control) ? control : .key3
                lastFlash = (key, Date(), (lastFlash?.count ?? 0) + 1)
            }
            for control in controls {
                pressed.insert(control)
                if control.isRotation {
                    withAnimation(.spring(response: 0.25)) { knobAngle += control == .knobRight ? 24 : -24 }
                }
            }
            if case .wheel = trigger { releaseLater(controls) }
            for control in controls where control.isRotation { releaseLater([control]) }
            let entry = LogEntry(
                control: controls.first,
                text: controls.first.flatMap { config[$0]?.label } ?? fallback
            )
            log = Array(([entry] + log).prefix(8))
        } else {
            for control in controls where !control.isRotation { pressed.remove(control) }
        }
    }

    private func releaseLater(_ controls: [Control]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) { [weak self] in
            controls.forEach { self?.pressed.remove($0) }
        }
    }
}
