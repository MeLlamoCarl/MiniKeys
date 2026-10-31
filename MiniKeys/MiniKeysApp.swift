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

        MenuBarExtra("MiniKeys", systemImage: "keyboard.badge.ellipsis") {
            MenuBarContent()
                .environmentObject(model)
        }
    }
}

private struct MenuBarContent: View {
    @EnvironmentObject private var model: AppModel
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Text(model.device.isConnected ? "Teclado conectado" : "Teclado desconectado")
        Divider()
        Picker("Capa", selection: Binding(get: { model.activeLayer }, set: { model.activateLayer($0) })) {
            ForEach(0..<AppModel.layerCount, id: \.self) { Text("Capa \($0 + 1)").tag($0) }
        }
        Picker("Luz", selection: Binding(get: { model.ledMode }, set: { if let mode = $0 { model.setLEDMode(mode) } })) {
            ForEach(LEDMode.allCases, id: \.self) { Text($0.title).tag(Optional($0)) }
        }
        Divider()
        Button("Abrir MiniKeys…") {
            openWindow(id: "main")
            NSApp.activate(ignoringOtherApps: true)
        }
        Button("Salir") { NSApp.terminate(nil) }
            .keyboardShortcut("q")
    }
}
