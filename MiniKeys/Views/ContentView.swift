import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        VStack(spacing: 0) {
            KeypadStage()
            ScrollView {
                HStack(alignment: .top, spacing: 16) {
                    ActionEditor()
                        .frame(maxWidth: .infinity)
                    VStack(spacing: 16) {
                        LightPanel()
                        PresetPanel()
                    }
                    .frame(width: 280)
                }
                .padding(20)
            }
        }
        .frame(minWidth: 880, minHeight: 640)
        // HIG: a concise window title (not the app name); status goes in the subtitle, not in a
        // custom badge, so the toolbar keeps the system's own glass appearance.
        .navigationTitle("Mini teclado")
        .navigationSubtitle(model.device.isConnected ? "Conectado" : "Desconectado")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                LayerPicker()
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    model.writeAll()
                } label: {
                    Label("Reescribir capa", systemImage: "arrow.trianglehead.2.clockwise")
                }
                .help("Vuelve a escribir en el teclado todas las teclas de esta capa")
                .disabled(!model.device.isConnected)
            }
        }
        .background(Color(nsColor: .windowBackgroundColor))
        .overlay(alignment: .bottom) {
            if let toast = model.toast {
                ToastView(toast: toast)
                    .padding(.bottom, 20)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
}

private struct LayerPicker: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Picker("Capa", selection: Binding(get: { model.activeLayer }, set: { model.activateLayer($0) })) {
            ForEach(0..<AppModel.layerCount, id: \.self) { Text("Capa \($0 + 1)").tag($0) }
        }
        .pickerStyle(.segmented)
        .help("El teclado guarda 3 capas. Elegir una aquí también la activa en el teclado.")
    }
}

private struct LightPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 14) {
                Label("Luz", systemImage: "rainbow")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 6) {
                    Picker("Luz", selection: Binding(
                        get: { model.ledMode },
                        set: { if let mode = $0 { model.setLEDMode(mode) } }
                    )) {
                        ForEach(LEDMode.allCases, id: \.self) { mode in
                            Label(mode.title, systemImage: mode.symbol).tag(Optional(mode))
                        }
                    }
                    .pickerStyle(.radioGroup)
                    .labelsHidden()
                    Text("Se guarda en el teclado. Colores y animaciones vienen de fábrica: «Ola de colores» recorre las teclas en rojo, azul y verde; «Al presionar» enciende la tecla pulsada.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Divider()

                Toggle("Apagar al bloquear el Mac", isOn: $model.dimsWhenLocked)
                    .help("Apaga la luz mientras el Mac está bloqueado o con la pantalla apagada, y la vuelve a encender al regresar. No se guarda en el teclado.")
            }
        }
    }
}

private struct PresetPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 10) {
                Label("Plantillas", systemImage: "square.grid.2x2")
                    .font(.headline)
                ForEach(Presets.all) { preset in
                    Button {
                        model.applyPreset(preset)
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: preset.symbol)
                                .frame(width: 22)
                                .foregroundStyle(Color.accentColor)
                            VStack(alignment: .leading, spacing: 1) {
                                Text(preset.title).font(.callout.weight(.semibold))
                                Text(preset.subtitle).font(.caption).foregroundStyle(.secondary).lineLimit(1)
                            }
                            Spacer(minLength: 0)
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.primary.opacity(0.04)))
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.pressable)
                    .help("Configura toda la capa \(model.activeLayer + 1) de una vez")
                }
            }
        }
    }
}

struct Card<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color(nsColor: .controlBackgroundColor))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .strokeBorder(Color.primary.opacity(0.08))
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
            .background(.regularMaterial, in: Capsule())
            .shadow(color: .black.opacity(0.15), radius: 8, y: 3)
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
