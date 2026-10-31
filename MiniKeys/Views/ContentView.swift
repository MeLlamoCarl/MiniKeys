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
        .toolbar {
            ToolbarItem(placement: .navigation) {
                ConnectionBadge(isConnected: model.device.isConnected)
            }
            ToolbarItemGroup(placement: .primaryAction) {
                LayerControls()
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

private struct LayerControls: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Picker("Capa", selection: Binding(get: { model.activeLayer }, set: { model.activateLayer($0) })) {
            ForEach(0..<AppModel.layerCount, id: \.self) { Text("Capa \($0 + 1)").tag($0) }
        }
        .pickerStyle(.segmented)
        .help("El teclado guarda 3 capas. Elegir una aquí también la activa en el teclado.")
        Menu {
            Button("Reescribir esta capa en el teclado") { model.writeAll() }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
        .help("Más opciones")
    }
}

struct ConnectionBadge: View {
    let isConnected: Bool

    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(isConnected ? Color.green : Color.orange)
                .frame(width: 8, height: 8)
            Text(isConnected ? "Teclado conectado" : "Conecta el teclado por USB")
                .font(.callout.weight(.medium))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Capsule().fill(Color.primary.opacity(0.06)))
    }
}

private struct LightPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 10) {
                Label("Luz", systemImage: "rainbow")
                    .font(.headline)
                ForEach(LEDMode.allCases, id: \.self) { mode in
                    OptionRow(title: mode.title, symbol: mode.symbol, isSelected: model.ledMode == mode) {
                        model.setLEDMode(mode)
                    }
                }
                Text("El efecto de colores es fijo de fábrica; solo se puede elegir cuándo se enciende.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
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
                    .buttonStyle(.plain)
                    .help("Configura toda la capa \(model.activeLayer + 1) de una vez")
                }
            }
        }
    }
}

private struct OptionRow: View {
    let title: String
    let symbol: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: symbol)
                    .frame(width: 22)
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundStyle(Color.accentColor)
                }
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(isSelected ? Color.accentColor.opacity(0.15) : Color.primary.opacity(0.04))
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
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
