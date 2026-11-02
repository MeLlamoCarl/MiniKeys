import SwiftUI

@main
struct MiniKeysApp: App {
    @StateObject private var model = AppModel()

    init() {
        LaunchAtLogin.refresh()
    }

    var body: some Scene {
        Window("MiniKeys", id: "main") {
            ContentView()
                .environmentObject(model)
        }
        .defaultSize(width: 1120, height: 800)
        .windowResizability(.contentMinSize)
        .windowToolbarStyle(.unified(showsTitle: true))
        .commands { KeyboardCommands(model: model) }

        Window("About MiniKeys", id: "about") {
            AboutView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .defaultPosition(.center)
        // Opened from MiniKeys › About MiniKeys and the menu bar, not listed in the Window menu.
        .commandsRemoved()

        MenuBarExtra("MiniKeys", systemImage: "keyboard.badge.ellipsis") {
            MenuBarContent()
                .environmentObject(model)
        }
    }
}

/// HIG: every toolbar action is also available from the menu bar.
private struct KeyboardCommands: Commands {
    @ObservedObject var model: AppModel

    var body: some Commands {
        CommandGroup(replacing: .appInfo) {
            AboutMenuButton()
        }
        CommandGroup(replacing: .help) {
            TourMenuButton()
                .environmentObject(model)
            Link("MiniKeys on GitHub", destination: URL(string: "https://github.com/MeLlamoCarl/MiniKeys")!)
        }
        CommandMenu("Keypad") {
            Button("New Layer") { model.addLayer() }
                .keyboardShortcut("n", modifiers: .command)
                .disabled(!model.canAddLayer)
            Button("Rename and Color Layer…") { model.sheet = .layerSettings(model.activeLayerID) }
            Divider()
            Button("Previous Layer") { model.activateAdjacentLayer(-1) }
                .keyboardShortcut("[", modifiers: .command)
                .disabled(model.layers.count < 2)
            Button("Next Layer") { model.activateAdjacentLayer(1) }
                .keyboardShortcut("]", modifiers: .command)
                .disabled(model.layers.count < 2)
            Menu("Layers") {
                ForEach(Array(model.layers.enumerated()), id: \.element.id) { index, layer in
                    if index < 9 {
                        Toggle(layer.name, isOn: Binding(
                            get: { model.activeLayerID == layer.id },
                            set: { if $0 { model.activateLayer(layer.id) } }
                        ))
                        .keyboardShortcut(KeyEquivalent(Character("\(index + 1)")), modifiers: .command)
                    } else {
                        Toggle(layer.name, isOn: Binding(
                            get: { model.activeLayerID == layer.id },
                            set: { if $0 { model.activateLayer(layer.id) } }
                        ))
                    }
                }
            }
            Divider()
            Button("Save Layer as Preset…") { model.sheet = .presetEditor(nil) }
            Menu("Apply Preset") {
                ForEach(model.allPresets) { preset in
                    Button(preset.title) { model.applyPreset(preset) }
                }
            }
            Divider()
            if model.device.hasMiniKeysFirmware {
                Picker("Light", selection: Binding(get: { model.lightSettings.effect }, set: { effect in model.updateLight { $0.effect = effect } })) {
                    ForEach(FirmwareEffect.allCases, id: \.self) { Text($0.title).tag($0) }
                }
            } else {
                Picker("Light", selection: Binding(get: { model.ledMode }, set: { if let mode = $0 { model.setLEDMode(mode) } })) {
                    ForEach(LEDMode.allCases, id: \.self) { Text($0.title).tag(Optional($0)) }
                }
            }
            Link("Firmware…", destination: URL(string: "https://github.com/MeLlamoCarl/MiniKeys-Firmware#install")!)
            Divider()
            Button("Save Layer to Keypad") { model.writeAll() }
                .keyboardShortcut("r", modifiers: [.command, .shift])
                .disabled(!model.device.isConnected)
        }
    }
}

private struct MenuBarContent: View {
    @EnvironmentObject private var model: AppModel
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Text(model.device.isConnected ? "Keypad connected" : "Keypad disconnected")
        Divider()
        Picker("Layer", selection: Binding(get: { model.activeLayerID }, set: { model.activateLayer($0) })) {
            ForEach(model.layers) { Text($0.name).tag($0.id) }
        }
        Menu("Apply Preset") {
            ForEach(model.allPresets) { preset in
                Button(preset.title) { model.applyPreset(preset) }
            }
        }
        if model.device.hasMiniKeysFirmware {
            Picker("Light", selection: Binding(get: { model.lightSettings.effect }, set: { effect in model.updateLight { $0.effect = effect } })) {
                ForEach(FirmwareEffect.allCases, id: \.self) { Text($0.title).tag($0) }
            }
        } else {
            Picker("Light", selection: Binding(get: { model.ledMode }, set: { if let mode = $0 { model.setLEDMode(mode) } })) {
                ForEach(LEDMode.allCases, id: \.self) { Text($0.title).tag(Optional($0)) }
            }
        }
        Divider()
        TourMenuButton()
        AboutMenuButton()
        Toggle("Launch at Login", isOn: $model.launchesAtLogin)
        Divider()
        Button("Open MiniKeys…") {
            openWindow(id: "main")
            NSApp.activate(ignoringOtherApps: true)
        }
        Button("Quit MiniKeys") { NSApp.terminate(nil) }
            .keyboardShortcut("q")
    }
}
