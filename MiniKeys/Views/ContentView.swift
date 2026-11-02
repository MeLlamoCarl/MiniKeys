import SwiftUI
import UniformTypeIdentifiers

/// Sheets the window can show, also opened from the menu bar commands.
enum AppSheet: Identifiable {
    case welcome
    case layerSettings(UUID)
    case presetEditor(CustomPreset?)          // nil: save the active layer as a new preset

    var id: String {
        switch self {
        case .welcome: "welcome"
        case .layerSettings(let id): "layer-\(id)"
        case .presetEditor(let preset): "preset-\(preset?.id.uuidString ?? "new")"
        }
    }
}

struct ContentView: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        NavigationSplitView {
            LayerSidebar()
                .navigationSplitViewColumnWidth(min: 190, ideal: 220, max: 300)
        } detail: {
            DetailView()
        }
        .frame(minWidth: 860, minHeight: 600)
        // HIG: a concise window title (the layer, not the app name); status in the subtitle.
        .navigationTitle(model.activeLayer.name)
        .navigationSubtitle(model.device.isConnected ? "Keypad connected" : "Keypad disconnected")
        .toolbar {
            SaveToKeypadToolbarItem()
        }
        .sheet(item: $model.sheet) { sheet in
            switch sheet {
            case .welcome: WelcomeSheet()
            case .layerSettings(let id): LayerSettingsSheet(layerID: id)
            case .presetEditor(let preset): PresetEditorSheet(preset: preset)
            }
        }
        .overlay(alignment: .bottom) {
            if let toast = model.toast {
                ToastView(toast: toast)
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .task {
            // First launch: the welcome sheet, once the window has settled.
            guard !model.hasSeenTour else { return }
            try? await Task.sleep(nanoseconds: 500_000_000)
            model.showWelcome()
        }
    }
}

// MARK: - Sidebar

private struct LayerSidebar: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        List(selection: Binding(
            get: { Optional(model.activeLayerID) },
            // Only clicks switch layers: the keypad itself can send ↑ ↓ (the AI preset's knob), and
            // the arrow keys would move the sidebar selection. ⌘[ and ⌘] switch from the keyboard.
            set: { if let id = $0, NSApp.currentEvent?.type != .keyDown { model.activateLayer(id) } }
        )) {
            Section {
                ForEach(Array(model.layers.enumerated()), id: \.element.id) { index, layer in
                    LayerRow(layer: layer, keypadSlot: model.isSavedOnKeypad(index) ? index + 1 : nil)
                        .tag(layer.id)
                        .contextMenu { LayerMenuItems(layer: layer) }
                        // Swipe left with two fingers on the trackpad, like a conversation in Messages.
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            if model.layers.count > 1 {
                                Button(role: .destructive) {
                                    model.deleteLayer(layer.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                        .labelStyle(.iconOnly)
                                }
                            }
                        }
                }
                .onMove { model.moveLayers(from: $0, to: $1) }
            } header: {
                Text("Layers")
            }
        }
        .listStyle(.sidebar)
        .tourStop(.layers, arrowEdge: .trailing)
        .safeAreaInset(edge: .bottom) {
            VStack(alignment: .leading, spacing: 4) {
                if model.savedLayerCount > 0 {
                    Text("\(Image(systemName: "keyboard")) Saved on the keypad. Drag to choose which.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                Text("\(model.layers.count) of \(KeypadLayer.maxCount) layers")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
        }
        // HIG: no key actions at the bottom of a sidebar; New Layer lives in its toolbar.
        .toolbar {
            ToolbarItem {
                Button {
                    model.addLayer()
                } label: {
                    Label("New Layer", systemImage: "plus")
                }
                .disabled(!model.canAddLayer)
                .help("New layer (⌘N), up to \(KeypadLayer.maxCount)")
            }
        }
    }
}

private struct LayerRow: View {
    @EnvironmentObject private var model: AppModel
    let layer: KeypadLayer
    let keypadSlot: Int?

    var body: some View {
        Label {
            HStack(spacing: 6) {
                Text(layer.name)
                    .lineLimit(1)
                Spacer(minLength: 4)
                if let keypadSlot {
                    Label("\(keypadSlot)", systemImage: "keyboard")
                        .labelStyle(.titleAndIcon)
                        .font(.caption2.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Capsule().fill(.primary.opacity(0.08)))
                        .help("Saved on the keypad as layer \(keypadSlot)")
                }
            }
        } icon: {
            Circle()
                .fill(layer.color.color)
                .frame(width: 10, height: 10)
                .overlay(Circle().strokeBorder(.primary.opacity(0.15)))
        }
        .help(layer.id == model.activeLayerID ? "On the keypad now" : "Click to write this layer to the keypad")
    }
}

struct LayerMenuItems: View {
    @EnvironmentObject private var model: AppModel
    let layer: KeypadLayer

    var body: some View {
        Button("Rename and Color…") { model.sheet = .layerSettings(layer.id) }
        Button("Duplicate") { model.addLayer(duplicating: layer) }
            .disabled(!model.canAddLayer)
        Button("Save as Preset…") {
            model.activateLayer(layer.id)
            model.sheet = .presetEditor(nil)
        }
        Divider()
        Button("Delete", role: .destructive) { model.deleteLayer(layer.id) }
            .disabled(model.layers.count == 1)
    }
}

// MARK: - Detail

private struct DetailView: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        GeometryReader { proxy in
            ScrollViewReader { scroller in
                ScrollView {
                    VStack(spacing: 16) {
                        KeypadStage()
                            .tourStop(.keypad)
                        // Side by side when there is room, stacked in narrow windows.
                        if proxy.size.width >= 820 {
                            HStack(alignment: .top, spacing: 16) {
                                mainColumn
                                sideColumn
                                    .frame(width: 300)
                            }
                        } else {
                            VStack(spacing: 16) {
                                mainColumn
                                sideColumn
                            }
                        }
                    }
                    .padding(20)
                }
                .onChange(of: model.tourTarget) { step in
                    guard let step, step.isInDetail else { return }
                    // Without animation, so the view is in place when its popover opens.
                    scroller.scrollTo(step, anchor: .center)
                }
            }
        }
        .background(WindowMaterial())
    }

    private var mainColumn: some View {
        VStack(spacing: 16) {
            ActionEditor()
                .tourStop(.editor, arrowEdge: .trailing)
            PresetsPanel()
                .tourStop(.presets, arrowEdge: .trailing)
        }
    }

    private var sideColumn: some View {
        VStack(spacing: 16) {
            LightPanel()
                .tourStop(.light, arrowEdge: .leading)
            FirmwarePanel()
                .tourStop(.firmware, arrowEdge: .leading)
        }
    }
}

/// Translucent window background (content layer: a standard material, per the HIG).
struct WindowMaterial: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = .underWindowBackground
        view.blendingMode = .behindWindow
        view.state = .followsWindowActiveState
        return view
    }

    func updateNSView(_ view: NSVisualEffectView, context: Context) {}
}

// MARK: - Presets

private struct PresetsPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Label("Presets", systemImage: "square.grid.2x2")
                        .font(.headline)
                    Spacer()
                    Button {
                        model.sheet = .presetEditor(nil)
                    } label: {
                        Label("Save Layer as Preset…", systemImage: "plus")
                    }
                    .help("Saves the keys of \(model.activeLayer.name) as a preset you can reuse or share")
                    Button {
                        importPresets()
                    } label: {
                        Label("Import…", systemImage: "square.and.arrow.down")
                    }
                    .help("Imports presets shared by others (.minikeys-preset)")
                }
                .controlSize(.small)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 190), spacing: 10)], spacing: 10) {
                    ForEach(Presets.all) { preset in
                        PresetTile(preset: preset, custom: nil)
                    }
                    ForEach(model.customPresets) { custom in
                        PresetTile(preset: custom.preset, custom: custom)
                    }
                }

                Text("A preset replaces the keys of the current layer, \(model.activeLayer.name).")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private func importPresets() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [UTType(filenameExtension: "minikeys-preset") ?? .json, .json]
        panel.allowsMultipleSelection = true
        panel.message = "Choose MiniKeys presets to import"
        if panel.runModal() == .OK { model.importPresets(from: panel.urls) }
    }
}

private struct PresetTile: View {
    @EnvironmentObject private var model: AppModel
    let preset: Preset
    let custom: CustomPreset?

    var body: some View {
        Button {
            model.applyPreset(preset)
        } label: {
            HStack(spacing: 10) {
                Image(systemName: preset.symbol)
                    .font(.title3)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 26)
                VStack(alignment: .leading, spacing: 2) {
                    Text(preset.title)
                        .font(.callout.weight(.semibold))
                        .lineLimit(1)
                    Text(preset.subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                Spacer(minLength: 0)
                if custom != nil {
                    Image(systemName: "person.fill")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                        .help("Your preset")
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).strokeBorder(.primary.opacity(0.06)))
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .buttonStyle(.pressable)
        .help("Applies “\(preset.title)” to \(model.activeLayer.name): \(preset.subtitle)")
        .contextMenu {
            if let custom {
                Button("Edit…") { model.sheet = .presetEditor(custom) }
                Button("Export…") { export(custom) }
                Divider()
                Button("Delete", role: .destructive) { model.deleteCustomPreset(custom.id) }
            } else {
                Button("Apply to \(model.activeLayer.name)") { model.applyPreset(preset) }
            }
        }
    }

    private func export(_ preset: CustomPreset) {
        let panel = NSSavePanel()
        panel.nameFieldStringValue = "\(preset.title).minikeys-preset"
        panel.allowedContentTypes = [UTType(filenameExtension: "minikeys-preset") ?? .json]
        panel.message = "Share this file: anyone can import it in MiniKeys"
        guard panel.runModal() == .OK, let url = panel.url else { return }
        do {
            try model.exportPreset(preset, to: url)
            model.showToast("Exported “\(preset.title)”", isError: false)
        } catch {
            model.showToast(error.localizedDescription, isError: true)
        }
    }
}

// MARK: - Sheets

private struct LayerSettingsSheet: View {
    @EnvironmentObject private var model: AppModel
    @Environment(\.dismiss) private var dismiss
    let layerID: UUID
    @State private var name = ""
    @State private var color = Color.blue

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Layer")
                .font(.headline)
            Form {
                TextField("Name", text: $name)
                ColorPicker("Color", selection: $color, supportsOpacity: false)
            }
            .formStyle(.grouped)
            HStack {
                Button("Delete Layer", role: .destructive) {
                    model.deleteLayer(layerID)
                    dismiss()
                }
                .disabled(model.layers.count == 1)
                Spacer()
                Button("Cancel") { dismiss() }
                    .keyboardShortcut(.cancelAction)
                Button("Done") {
                    model.updateLayer(layerID, name: name, color: RGB(color))
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(20)
        .frame(width: 380)
        .onAppear {
            if let layer = model.layers.first(where: { $0.id == layerID }) {
                name = layer.name
                color = layer.color.color
            }
        }
    }
}

private struct PresetEditorSheet: View {
    @EnvironmentObject private var model: AppModel
    @Environment(\.dismiss) private var dismiss
    let preset: CustomPreset?
    @State private var title = ""
    @State private var symbol = CustomPreset.symbols[0]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(preset == nil ? "Save \(model.activeLayer.name) as a Preset" : "Edit Preset")
                .font(.headline)
            Form {
                TextField("Name", text: $title, prompt: Text("Geometry Dash, Figma…"))
                LabeledContent("Icon") {
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(30), spacing: 6), count: 7), spacing: 6) {
                        ForEach(CustomPreset.symbols, id: \.self) { name in
                            Button {
                                symbol = name
                            } label: {
                                Image(systemName: name)
                                    .frame(width: 30, height: 30)
                                    .background(
                                        RoundedRectangle(cornerRadius: 7)
                                            .fill(symbol == name ? Color.accentColor.opacity(0.25) : Color.clear)
                                    )
                                    .contentShape(Rectangle())
                            }
                            .buttonStyle(.pressable)
                            .accessibilityLabel(name)
                        }
                    }
                }
            }
            .formStyle(.grouped)
            if preset == nil {
                Text("Saves the keys and knob of \(model.activeLayer.name). Export it later to share it.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            HStack {
                Spacer()
                Button("Cancel") { dismiss() }
                    .keyboardShortcut(.cancelAction)
                Button(preset == nil ? "Save" : "Done") {
                    if var preset {
                        preset.title = title.isEmpty ? preset.title : String(title.prefix(40))
                        preset.symbol = symbol
                        model.updateCustomPreset(preset)
                    } else {
                        model.saveActiveLayerAsPreset(title: title, symbol: symbol)
                    }
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(20)
        .frame(width: 420)
        .onAppear {
            title = preset?.title ?? ""
            symbol = preset?.symbol ?? CustomPreset.symbols[0]
        }
    }
}

// MARK: - Light

private struct LightPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 14) {
                Label("Light", systemImage: "rainbow")
                    .font(.headline)

                if model.device.hasMiniKeysFirmware {
                    FirmwareLightControls()
                } else {
                    stockControls
                }

                Divider()

                Toggle("Turn off while the Mac is locked", isOn: $model.dimsWhenLocked)
                    .help("Turns the light off while the Mac is locked or its display is asleep, and back on when you return. Not saved on the keypad.")
            }
        }
    }

    private var stockControls: some View {
        VStack(alignment: .leading, spacing: 6) {
            Picker("Light", selection: Binding(
                get: { model.ledMode },
                set: { if let mode = $0 { model.setLEDMode(mode) } }
            )) {
                ForEach(LEDMode.allCases, id: \.self) { mode in
                    Label(mode.title, systemImage: mode.symbol).tag(Optional(mode))
                }
            }
            .pickerStyle(.radioGroup)
            .labelsHidden()
            Text("Saved on the keypad. Colors and animations are built in: Color Wave runs over the keys in red, blue and green; On Press lights the key you press.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

/// Light settings of the MiniKeys firmware: any effect, color, speed and brightness.
private struct FirmwareLightControls: View {
    @EnvironmentObject private var model: AppModel

    private var settings: LightSettings { model.lightSettings }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Picker("Effect", selection: Binding(
                get: { settings.effect },
                set: { effect in model.updateLight { $0.effect = effect } }
            )) {
                ForEach(FirmwareEffect.allCases, id: \.self) { effect in
                    Label(effect.title, systemImage: effect.symbol).tag(effect)
                }
            }

            if settings.effect.canCycleColors {
                Toggle("Cycle colors", isOn: Binding(
                    get: { settings.multicolor },
                    set: { value in model.updateLight { $0.multicolor = value } }
                ))
            }

            if settings.effect.usesColor {
                ColorPicker("Color", selection: Binding(
                    get: { settings.color.color },
                    set: { color in model.updateLight { $0.color = RGB(color) } }
                ), supportsOpacity: false)
                .disabled(settings.effect.canCycleColors && settings.multicolor)
            }

            if settings.effect == .layer {
                Text("Uses the color of the layer on the keypad. Change it from the layer's menu in the sidebar.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            if settings.effect.usesSpeed {
                LabeledSlider(title: "Speed:", value: Binding(
                    get: { Double(settings.speed) },
                    set: { value in model.updateLight { $0.speed = Int(value.rounded()) } }
                ), range: 1...10, step: 1, minimumSymbol: "tortoise.fill", maximumSymbol: "hare.fill",
                   valueText: "\(settings.speed) of 10")
            }

            LabeledSlider(title: "Brightness:", value: Binding(
                get: { Double(settings.brightness) },
                set: { value in model.updateLight { $0.brightness = Int(value.rounded()) } }
            ), range: 10...255, minimumSymbol: "sun.min", maximumSymbol: "sun.max.fill",
               valueText: "\(Int((Double(settings.brightness) / 255 * 100).rounded())) %")

            Toggle("Show layer color on switch", isOn: Binding(
                get: { settings.flashesLayer },
                set: { value in model.updateLight { $0.flashesLayer = value } }
            ))
            .help("The keypad briefly lights up in the layer's color when you switch layers")
        }
    }
}

/// HIG: a labeled slider (label ending in a colon), icons for its minimum and maximum, tick marks
/// for stepped values, the exact value in a tooltip, and a bounded width so it never stretches.
private struct LabeledSlider: View {
    let title: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    var step: Double? = nil
    let minimumSymbol: String
    let maximumSymbol: String
    let valueText: String

    var body: some View {
        HStack(spacing: 8) {
            Text(title)
                .frame(width: 84, alignment: .leading)
            Group {
                if let step {
                    Slider(value: $value, in: range, step: step) {
                        Text(title)
                    } minimumValueLabel: {
                        Image(systemName: minimumSymbol)
                    } maximumValueLabel: {
                        Image(systemName: maximumSymbol)
                    }
                } else {
                    Slider(value: $value, in: range) {
                        Text(title)
                    } minimumValueLabel: {
                        Image(systemName: minimumSymbol)
                    } maximumValueLabel: {
                        Image(systemName: maximumSymbol)
                    }
                }
            }
            .labelsHidden()
            .foregroundStyle(.secondary)
            .frame(maxWidth: 220)
            .help(valueText)
            Spacer(minLength: 0)
        }
    }
}

private struct FirmwarePanel: View {
    @EnvironmentObject private var model: AppModel

    static let installerURL = URL(string: "https://github.com/MeLlamoCarl/MiniKeys-Firmware#install")!

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 10) {
                // One line says which firmware the keypad runs.
                Label(firmwareTitle, systemImage: "memorychip")
                    .font(.headline)
                if !model.device.isConnected {
                    Text("Connect the keypad to see its firmware.")
                        .foregroundStyle(.secondary)
                } else if model.device.firmwareVersion != nil {
                    if model.savedLayerCount > 0 {
                        comboControls
                    } else {
                        Text("Update to firmware 4 to save 3 layers on the keypad and switch them there.")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Link("Update Firmware…", destination: Self.installerURL)
                        .font(.callout)
                } else {
                    Text("The MiniKeys firmware adds any color, more effects, and 3 layers you can switch on the keypad.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    Link("Install MiniKeys Firmware…", destination: Self.installerURL)
                        .font(.callout)
                }
            }
        }
    }

    private var firmwareTitle: String {
        guard model.device.isConnected else { return "Keypad" }
        return model.device.firmwareVersion.map { "MiniKeys Firmware \($0)" } ?? "Stock Firmware"
    }

    private var comboControls: some View {
        VStack(alignment: .leading, spacing: 6) {
            Divider()
            Toggle("Switch layers with the knob", isOn: Binding(
                get: { model.switchesLayersOnKeypad },
                set: { model.setSwitchesLayersOnKeypad($0) }
            ))
            if model.switchesLayersOnKeypad {
                gestureHint("arrow.clockwise", "Next saved layer")
                gestureHint("arrow.counterclockwise", "Previous saved layer")
            }
            Text(model.switchesLayersOnKeypad
                 ? "The keys blink the layer's number in its color. A knob press acts when you let go."
                 : "The knob's press and turns always do their own actions.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    /// "⊙ + ↻  Next saved layer": press the knob and turn it this way.
    private func gestureHint(_ turn: String, _ title: String) -> some View {
        HStack(spacing: 4) {
            Image(systemName: "digitalcrown.horizontal.press")
            Text("+")
            Image(systemName: turn)
            Text(title).padding(.leading, 4)
        }
        .font(.callout)
        .foregroundStyle(.secondary)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Press and turn the knob \(turn == "arrow.clockwise" ? "right" : "left"): \(title)")
    }
}

// MARK: - Shared

/// A content-layer card on a standard material (Liquid Glass is reserved for controls).
struct Card<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(.primary.opacity(0.07))
            )
    }
}

private struct ToastView: View {
    let toast: AppModel.Toast

    var body: some View {
        Label(toast.text, systemImage: toast.isError ? "exclamationmark.triangle.fill" : "checkmark.circle.fill")
            .font(.callout.weight(.medium))
            .foregroundStyle(toast.isError ? Color.orange : Color.green)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .liquidGlass(in: Capsule())
            .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
    }
}

extension View {
    /// Liquid Glass on macOS 26 and later, a translucent material before. For floating controls only.
    @ViewBuilder
    func liquidGlass<S: Shape>(in shape: S, interactive: Bool = false) -> some View {
        if #available(macOS 26.0, *) {
            glassEffect(interactive ? .regular.interactive() : .regular, in: shape)
        } else {
            background(.thinMaterial, in: shape)
        }
    }
}

/// HIG: one primary action, on the trailing side of the toolbar. On macOS 26 it's the round,
/// tinted Liquid Glass button on its own (without the toolbar's shared glass behind it); before,
/// a filled prominent button.
private struct SaveToKeypadToolbarItem: ToolbarContent {
    @EnvironmentObject private var model: AppModel

    var body: some ToolbarContent {
        if #available(macOS 26.0, *) {
            ToolbarItem(placement: .primaryAction) {
                button
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
            }
            .sharedBackgroundVisibility(.hidden)
        } else {
            ToolbarItem(placement: .primaryAction) {
                button
                    .buttonStyle(.borderedProminent)
            }
        }
    }

    private var button: some View {
        Button {
            model.writeAll()
        } label: {
            Label("Save to Keypad", systemImage: "checkmark")
        }
        .tint(.blue)
        // HIG: the tooltip says what the button does when the pointer rests on it.
        .help(model.device.isConnected
              ? "Save \(model.activeLayer.name) to the mini keypad (⇧⌘R)"
              : "Connect the mini keypad to save to it")
        .disabled(!model.device.isConnected)
        .tourStop(.save)
    }
}

/// HIG: custom buttons always need a press state.
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PressableButtonStyle {
    static var pressable: PressableButtonStyle { PressableButtonStyle() }
}
