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
                        FirmwarePanel()
                    }
                    .frame(width: 280)
                }
                .padding(20)
            }
        }
        .frame(minWidth: 880, minHeight: 640)
        // HIG: a concise window title (not the app name); status goes in the subtitle, not in a
        // custom badge, so the toolbar keeps the system's own glass appearance.
        .navigationTitle("Mini Keypad")
        .navigationSubtitle(model.device.isConnected ? "Connected" : "Disconnected")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                LayerPicker()
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    model.writeAll()
                } label: {
                    Label("Rewrite Layer", systemImage: "arrow.trianglehead.2.clockwise")
                }
                .help("Writes every key of this layer to the keypad again")
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
        Picker("Layer", selection: Binding(get: { model.activeLayer }, set: { model.activateLayer($0) })) {
            ForEach(0..<AppModel.layerCount, id: \.self) { Text("Layer \($0 + 1)").tag($0) }
        }
        .pickerStyle(.segmented)
        .help("The keypad stores 3 layers. Choosing one here also makes it active on the keypad.")
    }
}

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

            if settings.effect.usesSpeed {
                LabeledSlider(title: "Speed", value: Binding(
                    get: { Double(settings.speed) },
                    set: { value in model.updateLight { $0.speed = Int(value.rounded()) } }
                ), range: 1...10)
            }

            LabeledSlider(title: "Brightness", value: Binding(
                get: { Double(settings.brightness) },
                set: { value in model.updateLight { $0.brightness = Int(value.rounded()) } }
            ), range: 10...255)

            HStack(spacing: 8) {
                Text("Layers")
                Spacer()
                ForEach(0..<AppModel.layerCount, id: \.self) { layer in
                    ColorPicker("Layer \(layer + 1)", selection: Binding(
                        get: { settings.layerColors[layer].color },
                        set: { color in model.updateLight { $0.layerColors[layer] = RGB(color) } }
                    ), supportsOpacity: false)
                    .labelsHidden()
                    .help("Layer \(layer + 1)")
                }
            }

            Toggle("Blink layer number on switch", isOn: Binding(
                get: { settings.flashesLayer },
                set: { value in model.updateLight { $0.flashesLayer = value } }
            ))
            .help("The keypad blinks once per layer number, in the layer's color")

            Text("MiniKeys firmware: changes show right away and are saved on the keypad.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

private struct LabeledSlider: View {
    let title: String
    @Binding var value: Double
    let range: ClosedRange<Double>

    var body: some View {
        HStack {
            Text(title)
                .frame(width: 76, alignment: .leading)
            Slider(value: $value, in: range)
        }
    }
}

private struct FirmwarePanel: View {
    @EnvironmentObject private var model: AppModel

    static let installerURL = URL(string: "https://github.com/MeLlamoCarl/MiniKeys-Firmware#install")!

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 10) {
                Label("Firmware", systemImage: "cpu")
                    .font(.headline)
                if !model.device.isConnected {
                    Text("Connect the keypad to see its firmware.")
                        .foregroundStyle(.secondary)
                } else if let version = model.device.firmwareVersion {
                    Label("MiniKeys firmware \(version)", systemImage: "checkmark.seal.fill")
                    Text("All light effects and colors are available. Updates install over USB with MiniKeys Flasher.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    Link("Update Firmware…", destination: Self.installerURL)
                } else {
                    Label("Stock firmware", systemImage: "seal")
                    Text("Install the MiniKeys firmware for any color, more effects and instant layers. The first install means opening the keypad once.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    Link("Install MiniKeys Firmware…", destination: Self.installerURL)
                }
            }
        }
    }
}

private struct PresetPanel: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 10) {
                Label("Presets", systemImage: "square.grid.2x2")
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
                    .help("Sets up all of layer \(model.activeLayer + 1) at once")
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
