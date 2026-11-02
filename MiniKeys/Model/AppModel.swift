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

    /// The keypad layer MiniKeys writes the active layer to, with the stock firmware (or MiniKeys
    /// firmware before 4): it has 3 hardware layers but can't switch them by itself.
    static let hardwareLayer = 1
    /// MiniKeys firmware 4+: layers 1-3 are saved on the keypad (switchable there with a combo);
    /// slot 4 lives in its RAM and holds whichever other layer MiniKeys loads.
    static let savedKeypadLayers = 3
    static let liveKeypadLayer = 4

    @Published private(set) var layers: [KeypadLayer]
    @Published private(set) var activeLayerID: UUID
    @Published private(set) var customPresets: [CustomPreset]
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
    /// Sheet shown in the main window (also opened from the menu bar commands).
    @Published var sheet: AppSheet?
    /// Pressing and turning the knob switches the saved layers on the keypad (firmware 4+).
    @Published private(set) var switchesLayersOnKeypad: Bool

    let device = KeyboardDevice()
    let input = InputMonitor()

    private var cancellables = Set<AnyCancellable>()
    private let defaults = UserDefaults.standard

    private enum Keys {
        static let layers = "layers"                    // 3 × LayerConfig (before named layers)
        static let namedLayers = "namedLayers"
        static let activeLayerID = "activeLayerID"
        static let customPresets = "customPresets"
        static let switchesLayersOnKeypad = "switchesLayersOnKeypad"
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
        let storedLight = defaults.data(forKey: Keys.lightSettings)
            .flatMap { try? JSONDecoder().decode(LightSettings.self, from: $0) } ?? LightSettings()
        var loaded: [KeypadLayer] = []
        if let data = defaults.data(forKey: Keys.namedLayers),
           let stored = try? JSONDecoder().decode([KeypadLayer].self, from: data) {
            loaded = Array(stored.prefix(KeypadLayer.maxCount))
        } else if let data = defaults.data(forKey: Keys.layers),
                  let old = try? JSONDecoder().decode([LayerConfig].self, from: data) {
            // Before named layers: the keypad's 3 layers, colored like the firmware's layer colors.
            loaded = old.enumerated().map { index, config in
                KeypadLayer(name: "Layer \(index + 1)", color: storedLight.layerColors[safe: index] ?? KeypadLayer.palette[index], config: config)
            }
        }
        if loaded.isEmpty { loaded = [KeypadLayer(name: "Layer 1", color: KeypadLayer.palette[0])] }
        layers = loaded
        let storedID = defaults.string(forKey: Keys.activeLayerID).flatMap(UUID.init(uuidString:))
        let oldIndex = min(defaults.integer(forKey: "activeLayer"), loaded.count - 1)
        activeLayerID = loaded.first { $0.id == storedID }?.id ?? loaded[oldIndex].id
        switchesLayersOnKeypad = defaults.object(forKey: Keys.switchesLayersOnKeypad) as? Bool ?? true
        customPresets = defaults.data(forKey: Keys.customPresets)
            .flatMap { try? JSONDecoder().decode([CustomPreset].self, from: $0) } ?? []
        ledMode = defaults.object(forKey: Keys.ledMode) == nil ? nil : LEDMode(rawValue: defaults.integer(forKey: Keys.ledMode))
        dimsWhenLocked = defaults.object(forKey: Keys.dimsWhenLocked) as? Bool ?? true
        lightSettings = storedLight

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
        device.onLayerSwitched = { [weak self] layer in self?.keypadSwitchedLayer(layer) }

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

    var activeIndex: Int { layers.firstIndex { $0.id == activeLayerID } ?? 0 }
    var activeLayer: KeypadLayer { layers[activeIndex] }
    var config: LayerConfig { activeLayer.config }

    func action(for control: Control) -> Action? { config[control] }

    // MARK: - Editing

    func setAction(_ action: Action, for control: Control) {
        layers[activeIndex].config[control] = action
        saveLayers()
        write(KeypadProtocol.bind(action, to: control, layer: keypadSlot(for: activeIndex)),
              success: "\(control.title): \(action.label)")
    }

    func applyPreset(_ preset: Preset) {
        layers[activeIndex].config = preset.config
        saveLayers()
        write(layerPackets(activeLayer, slot: keypadSlot(for: activeIndex)), success: "“\(preset.title)” applied to \(activeLayer.name)")
    }

    /// Writes the active layer to the keypad again (e.g. after it was set up elsewhere).
    func writeAll() {
        write(layerPackets(activeLayer, slot: keypadSlot(for: activeIndex)) + selectPackets(for: activeIndex),
              success: "\(activeLayer.name) written to the keypad")
    }

    func setLEDMode(_ mode: LEDMode) {
        ledMode = mode
        defaults.set(mode.rawValue, forKey: Keys.ledMode)
        write(KeypadProtocol.setLED(mode, layer: Self.hardwareLayer), success: "Light: \(mode.title)")
    }

    // MARK: - Keypad slots

    /// How many layers are saved on the keypad: 3 with the MiniKeys firmware 4+, else none (MiniKeys
    /// writes the active layer to the keypad's layer 1).
    var savedLayerCount: Int {
        (device.firmwareVersion ?? 0) >= 4 ? Self.savedKeypadLayers : 0
    }

    func isSavedOnKeypad(_ index: Int) -> Bool { index < savedLayerCount }

    private func keypadSlot(for index: Int) -> Int {
        guard savedLayerCount > 0 else { return Self.hardwareLayer }
        return index < savedLayerCount ? index + 1 : Self.liveKeypadLayer
    }

    private func selectPackets(for index: Int) -> [[UInt8]] {
        savedLayerCount > 0 ? KeypadProtocol.selectLayerOnly(keypadSlot(for: index)) : []
    }

    /// Every control of a layer, including empty ones (disabled), so nothing of the previous
    /// layer stays in that keypad slot.
    private func layerPackets(_ layer: KeypadLayer, slot: Int) -> [[UInt8]] {
        Control.allCases.flatMap { control in
            KeypadProtocol.bind(layer.config[control] ?? .disabled, to: control, layer: slot)
        }
    }

    // MARK: - Layers

    var canAddLayer: Bool { layers.count < KeypadLayer.maxCount }

    func activateLayer(_ id: UUID) {
        guard let index = layers.firstIndex(where: { $0.id == id }), id != activeLayerID else { return }
        let layer = layers[index]
        activeLayerID = id
        defaults.set(id.uuidString, forKey: Keys.activeLayerID)
        var packets: [[UInt8]]
        if isSavedOnKeypad(index) {
            packets = KeypadProtocol.selectLayerOnly(index + 1)       // already on the keypad
        } else {
            packets = layerPackets(layer, slot: keypadSlot(for: index)) + selectPackets(for: index)
        }
        if device.hasMiniKeysFirmware {
            packets += KeypadProtocol.light(firmwareLight)
            if lightSettings.flashesLayer { flashLayerColor(layer.color) }
        }
        write(packets, success: "\(layer.name) is on the keypad")
    }

    func activateLayer(at index: Int) {
        guard layers.indices.contains(index) else { return }
        activateLayer(layers[index].id)
    }

    func activateAdjacentLayer(_ offset: Int) {
        activateLayer(at: (activeIndex + offset + layers.count) % layers.count)
    }

    /// The keypad switched saved layers by itself (press and turn).
    private func keypadSwitchedLayer(_ slot: Int) {
        guard savedLayerCount > 0, (1...savedLayerCount).contains(slot), layers.indices.contains(slot - 1) else { return }
        activeLayerID = layers[slot - 1].id
        defaults.set(activeLayerID.uuidString, forKey: Keys.activeLayerID)
        showToast("\(activeLayer.name), switched on the keypad", isError: false)
    }

    func setSwitchesLayersOnKeypad(_ isOn: Bool) {
        switchesLayersOnKeypad = isOn
        defaults.set(isOn, forKey: Keys.switchesLayersOnKeypad)
        write([KeypadProtocol.layerSwitching(isOn), KeypadProtocol.saveLight],
              success: isOn ? "Press and turn the knob to switch layers" : "Layer switching on the keypad is off")
    }

    /// Rewrites the saved keypad layers after the first three changed (order, colors, removal).
    private func syncSavedLayersIfNeeded() {
        guard savedLayerCount > 0, device.isConnected else { return }
        syncFirmware()
    }

    @discardableResult
    func addLayer(duplicating source: KeypadLayer? = nil) -> UUID? {
        guard canAddLayer else { return nil }
        let color = KeypadLayer.palette[layers.count % KeypadLayer.palette.count]
        let layer = KeypadLayer(
            name: source.map { "\($0.name) Copy" } ?? uniqueName("Layer \(layers.count + 1)"),
            color: source?.color ?? color,
            config: source?.config ?? [:]
        )
        layers.append(layer)
        saveLayers()
        if layers.count <= savedLayerCount { syncSavedLayersIfNeeded() }
        activateLayer(layer.id)
        return layer.id
    }

    func updateLayer(_ id: UUID, name: String? = nil, color: RGB? = nil) {
        guard let index = layers.firstIndex(where: { $0.id == id }) else { return }
        if let name {
            let trimmed = name.trimmingCharacters(in: .whitespaces)
            if !trimmed.isEmpty { layers[index].name = String(trimmed.prefix(30)) }
        }
        if let color { layers[index].color = color }
        saveLayers()
        if color != nil, device.hasMiniKeysFirmware, id == activeLayerID || isSavedOnKeypad(index) {
            device.send(KeypadProtocol.light(firmwareLight) + [KeypadProtocol.saveLight])
        }
    }

    func deleteLayer(_ id: UUID) {
        guard layers.count > 1, let index = layers.firstIndex(where: { $0.id == id }) else { return }
        let wasActive = id == activeLayerID
        layers.remove(at: index)
        saveLayers()
        if wasActive {
            activeLayerID = layers[min(index, layers.count - 1)].id
            defaults.set(activeLayerID.uuidString, forKey: Keys.activeLayerID)
        }
        if isSavedOnKeypad(index) || wasActive { syncFirmwareOrActive() }
    }

    func moveLayers(from source: IndexSet, to destination: Int) {
        let touchesKeypad = source.contains { isSavedOnKeypad($0) } || isSavedOnKeypad(destination)
        layers.move(fromOffsets: source, toOffset: destination)
        saveLayers()
        if touchesKeypad { syncSavedLayersIfNeeded() }
    }

    private func uniqueName(_ base: String) -> String {
        var name = base
        var number = layers.count + 1
        while layers.contains(where: { $0.name == name }) {
            number += 1
            name = "Layer \(number)"
        }
        return name
    }

    /// Briefly shows the layer's color on every key (MiniKeys firmware), without saving anything.
    private func flashLayerColor(_ color: RGB) {
        device.send([KeypadProtocol.keyColor(0, color)])
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            guard let self, liveLightOn == nil else { return }
            device.send([KeypadProtocol.clearKeyColors])
        }
    }

    private func syncFirmwareOrActive() {
        if savedLayerCount > 0 { syncFirmware() } else { writeAll() }
    }

    // MARK: - Custom presets

    var allPresets: [Preset] { Presets.all + customPresets.map(\.preset) }

    func saveActiveLayerAsPreset(title: String, symbol: String) {
        let trimmed = title.trimmingCharacters(in: .whitespaces)
        customPresets.append(CustomPreset(title: trimmed.isEmpty ? activeLayer.name : String(trimmed.prefix(40)),
                                          symbol: symbol, config: activeLayer.config))
        saveCustomPresets()
        showToast("Preset “\(customPresets.last!.title)” saved", isError: false)
    }

    func updateCustomPreset(_ preset: CustomPreset) {
        guard let index = customPresets.firstIndex(where: { $0.id == preset.id }) else { return }
        customPresets[index] = preset
        saveCustomPresets()
    }

    func deleteCustomPreset(_ id: UUID) {
        customPresets.removeAll { $0.id == id }
        saveCustomPresets()
    }

    func exportPreset(_ preset: CustomPreset, to url: URL) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        try encoder.encode(PresetFile(preset)).write(to: url, options: .atomic)
    }

    func importPresets(from urls: [URL]) {
        var imported = 0
        for url in urls {
            guard let data = try? Data(contentsOf: url),
                  let file = try? JSONDecoder().decode(PresetFile.self, from: data),
                  file.format == "minikeys-preset" else { continue }
            customPresets.append(file.customPreset)
            imported += 1
        }
        saveCustomPresets()
        showToast(imported > 0 ? "Imported \(imported) preset\(imported == 1 ? "" : "s")" : "No MiniKeys presets in that file",
                  isError: imported == 0)
    }

    private func saveCustomPresets() {
        if let data = try? JSONEncoder().encode(customPresets) {
            defaults.set(data, forKey: Keys.customPresets)
        }
    }

    // MARK: - MiniKeys firmware

    /// Light settings as sent to the firmware. Layer colors: the saved layers' (firmware 4+), or the
    /// active layer's in the slot MiniKeys uses.
    private var firmwareLight: LightSettings {
        var settings = lightSettings
        if savedLayerCount > 0 {
            for index in 0..<min(3, layers.count) { settings.layerColors[index] = layers[index].color }
        } else {
            settings.layerColors[0] = activeLayer.color
        }
        settings.flashesLayer = false             // MiniKeys shows the layer color itself
        return settings
    }

    /// Writes what the keypad should hold: the saved layers (firmware 4+) or the active layer, the
    /// light settings and the combo, then selects the active layer.
    private func syncFirmware() {
        var packets: [[UInt8]] = []
        if savedLayerCount > 0 {
            for index in 0..<min(savedLayerCount, layers.count) {
                packets += layerPackets(layers[index], slot: index + 1)
            }
            if !isSavedOnKeypad(activeIndex) {
                packets += layerPackets(activeLayer, slot: Self.liveKeypadLayer)
            }
            packets.append(KeypadProtocol.layerSwitching(switchesLayersOnKeypad))
        } else {
            packets += layerPackets(activeLayer, slot: Self.hardwareLayer)
        }
        packets += KeypadProtocol.light(firmwareLight)
        if !isSavedOnKeypad(activeIndex), savedLayerCount > 0 {
            packets.append(KeypadProtocol.layerColor(Self.liveKeypadLayer, activeLayer.color))
        }
        packets += [KeypadProtocol.saveLight] + KeypadProtocol.selectLayerOnly(keypadSlot(for: activeIndex))
        write(packets, success: "Keypad synced with MiniKeys")
        scheduleLightClockSync()
        if savedLayerCount > 0 { device.startListening() }
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
                device.send(KeypadProtocol.light(firmwareLight))
                scheduleLightClockSync()
            }
        }
        // Saving writes the keypad's flash, so wait until the edits stop.
        lightSaveWork?.cancel()
        let work = DispatchWorkItem { [weak self] in
            guard let self else { return }
            write(KeypadProtocol.light(firmwareLight) + [KeypadProtocol.saveLight], success: "Light saved on the keypad")
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
            device.send([KeypadProtocol.previewLED(.off, layer: Self.hardwareLayer)])
        }
    }

    private var restoreLightPacket: [UInt8] {
        device.hasMiniKeysFirmware
            ? KeypadProtocol.clearKeyColors
            : KeypadProtocol.previewLED(ledMode ?? .on, layer: Self.hardwareLayer)
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

    private func saveLayers() {
        if let data = try? JSONEncoder().encode(layers) {
            defaults.set(data, forKey: Keys.namedLayers)
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

    func showToast(_ text: String, isError: Bool) {
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

extension Array {
    subscript(safe index: Int) -> Element? { indices.contains(index) ? self[index] : nil }
}
