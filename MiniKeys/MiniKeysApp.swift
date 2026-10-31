import SwiftUI

@main
struct MiniKeysApp: App {
    @StateObject private var model = AppModel()

    var body: some Scene {
        Window("MiniKeys", id: "main") {
            ContentView()
                .environmentObject(model)
        }
        .defaultSize(width: 940, height: 860)
        .windowResizability(.contentMinSize)
        .windowToolbarStyle(.unified(showsTitle: true))
        .commands { KeyboardCommands(model: model) }

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
        CommandMenu("Keypad") {
            ForEach(0..<AppModel.layerCount, id: \.self) { layer in
                Toggle("Layer \(layer + 1)", isOn: Binding(
                    get: { model.activeLayer == layer },
                    set: { if $0 { model.activateLayer(layer) } }
                ))
                .keyboardShortcut(KeyEquivalent(Character("\(layer + 1)")), modifiers: .command)
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
            Divider()
            Link("Firmware…", destination: URL(string: "https://github.com/MeLlamoCarl/MiniKeys-Firmware#install")!)
            Divider()
            Button("Rewrite Layer on Keypad") { model.writeAll() }
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
        Picker("Layer", selection: Binding(get: { model.activeLayer }, set: { model.activateLayer($0) })) {
            ForEach(0..<AppModel.layerCount, id: \.self) { Text("Layer \($0 + 1)").tag($0) }
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
        Button("Open MiniKeys…") {
            openWindow(id: "main")
            NSApp.activate(ignoringOtherApps: true)
        }
        Button("Quit MiniKeys") { NSApp.terminate(nil) }
            .keyboardShortcut("q")
    }
}
