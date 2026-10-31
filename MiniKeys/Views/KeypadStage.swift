import SwiftUI

/// The on-screen keypad: mirrors the real one (bindings, presses, knob turns and the RGB glow) and
/// lets you pick the control to edit.
struct KeypadStage: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        VStack(spacing: 16) {
            TimelineView(.animation(minimumInterval: 1 / 30)) { timeline in
                device(at: timeline.date)
            }
            knobActions
            statusLine
        }
        .padding(.vertical, 22)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [Color(white: 0.13), Color(white: 0.07)],
                startPoint: .top, endPoint: .bottom
            )
        )
        .environment(\.colorScheme, .dark)
    }

    // MARK: Device

    private func device(at date: Date) -> some View {
        let phase = date.timeIntervalSinceReferenceDate * 0.12
        let glow = glowLevel(at: date)
        return HStack(spacing: 18) {
            ForEach([Control.key1, .key2, .key3]) { control in
                KeycapView(control: control, hue: (phase + Double(control.rawValue) * 0.18).truncatingRemainder(dividingBy: 1), glow: glow)
            }
            KnobView(glow: glow, hue: (phase + 0.7).truncatingRemainder(dividingBy: 1))
                .padding(.leading, 10)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 26)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.22).opacity(0.9), Color(white: 0.04).opacity(0.95)],
                        startPoint: .top, endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .strokeBorder(LinearGradient(colors: [.white.opacity(0.35), .white.opacity(0.05)], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                )
        )
        .background(
            // RGB underglow seen through the acrylic base.
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(AngularGradient(
                    colors: [.red, .orange, .yellow, .green, .cyan, .blue, .purple, .pink, .red],
                    center: .center, angle: .degrees(phase * 360)
                ))
                .padding(-6)
                .blur(radius: 22)
                .opacity(glow * 0.85)
        )
    }

    private func glowLevel(at date: Date) -> Double {
        switch model.ledMode {
        case .off: return 0
        case .on: return 1
        case .reactive: return max(0, 1 - date.timeIntervalSince(model.lastPress) / 0.9)
        case nil: return 0.35
        }
    }

    // MARK: Knob actions

    private var knobActions: some View {
        HStack(spacing: 10) {
            Text("Perilla")
                .font(.callout.weight(.semibold))
                .foregroundStyle(.secondary)
            ForEach([Control.knobLeft, .knobPress, .knobRight]) { control in
                KnobActionChip(control: control)
            }
        }
    }

    private var statusLine: some View {
        HStack(spacing: 8) {
            if let last = model.log.first {
                Image(systemName: "keyboard")
                Text(last.control.map { "\($0.title) → \(last.text)" } ?? "Entrada: \(last.text)")
                    .id(last.id)
                    .transition(.opacity)
            } else {
                Image(systemName: "hand.point.up.left")
                Text("Haz clic en una tecla o en la perilla para cambiar lo que hace. Presiona el teclado real para verlo aquí.")
            }
            if model.input.access != .granted {
                Button("Ver también en segundo plano…") { model.input.requestAccess() }
                    .buttonStyle(.link)
                    .help("Con el permiso de Monitoreo de entrada, MiniKeys distingue el teclado pequeño del teclado del Mac y muestra las pulsaciones aunque esté en segundo plano.")
            }
        }
        .font(.callout)
        .foregroundStyle(.secondary)
        .lineLimit(1)
        .animation(.easeOut(duration: 0.2), value: model.log.first?.id)
    }
}

private struct KeycapView: View {
    @EnvironmentObject private var model: AppModel
    let control: Control
    let hue: Double
    let glow: Double

    var body: some View {
        let isPressed = model.pressed.contains(control)
        let isSelected = model.selected == control
        let tint = Color(hue: hue, saturation: 0.8, brightness: 1)
        Button {
            model.selected = control
        } label: {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(LinearGradient(colors: [Color(white: 0.2), Color(white: 0.1)], startPoint: .top, endPoint: .bottom))
                    .overlay(
                        // Light leaking through the translucent switch housing.
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(RadialGradient(colors: [tint.opacity(0.55 * glow + (isPressed ? 0.4 : 0)), .clear], center: .bottom, startRadius: 2, endRadius: 70))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .strokeBorder(isSelected ? Color.accentColor : .white.opacity(0.12), lineWidth: isSelected ? 3 : 1)
                    )
                    .shadow(color: .black.opacity(0.6), radius: isPressed ? 1 : 6, y: isPressed ? 1 : 5)

                Text(control.shortTitle)
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(.white.opacity(0.45))
                    .padding(8)

                label
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(10)
            }
            .frame(width: 104, height: 104)
            .scaleEffect(isPressed ? 0.93 : 1)
            .offset(y: isPressed ? 3 : 0)
            .animation(.spring(response: 0.18, dampingFraction: 0.6), value: isPressed)
        }
        .buttonStyle(.plain)
        .help("\(control.title): \(model.action(for: control)?.label ?? "sin configurar")")
    }

    @ViewBuilder private var label: some View {
        if let action = model.action(for: control) {
            if let symbol = action.symbol {
                Image(systemName: symbol)
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white)
            } else {
                Text(action.label)
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.35)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        } else {
            Text("?")
                .font(.system(size: 26, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.3))
        }
    }
}

private struct KnobView: View {
    @EnvironmentObject private var model: AppModel
    let glow: Double
    let hue: Double

    var body: some View {
        let isPressed = model.pressed.contains(.knobPress)
        let isSelected = [Control.knobLeft, .knobPress, .knobRight].contains(model.selected)
        ZStack {
            Circle()
                .fill(Color(hue: hue, saturation: 0.8, brightness: 1).opacity(0.6 * glow))
                .blur(radius: 14)
                .frame(width: 120, height: 120)
            Circle()
                .fill(AngularGradient(
                    colors: [Color(white: 0.75), Color(white: 0.35), Color(white: 0.85), Color(white: 0.3), Color(white: 0.75)],
                    center: .center
                ))
                .frame(width: 104, height: 104)
                .overlay(Circle().strokeBorder(isSelected ? Color.accentColor : .black.opacity(0.4), lineWidth: isSelected ? 3 : 1))
                .shadow(color: .black.opacity(0.6), radius: 6, y: 4)
            Circle()
                .fill(RadialGradient(colors: [Color(white: 0.55), Color(white: 0.3)], center: .topLeading, startRadius: 4, endRadius: 80))
                .frame(width: 80, height: 80)
            Capsule()
                .fill(.white)
                .frame(width: 4, height: 18)
                .offset(y: -28)
                .rotationEffect(.degrees(model.knobAngle))
            HStack {
                rotateButton(.knobLeft)
                Spacer()
                rotateButton(.knobRight)
            }
            .frame(width: 164)
        }
        .scaleEffect(isPressed ? 0.94 : 1)
        .animation(.spring(response: 0.18, dampingFraction: 0.6), value: isPressed)
        .contentShape(Circle())
        .onTapGesture { model.selected = .knobPress }
        .help("Perilla: haz clic para editar la pulsación; usa las flechas para los giros")
    }

    private func rotateButton(_ control: Control) -> some View {
        let isActive = model.pressed.contains(control)
        return Button {
            model.selected = control
        } label: {
            Image(systemName: control.symbol)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(model.selected == control || isActive ? Color.accentColor : .white.opacity(0.55))
                .frame(width: 26, height: 26)
                .background(Circle().fill(.white.opacity(isActive ? 0.25 : 0.08)))
        }
        .buttonStyle(.plain)
        .help(control.title)
    }
}

private struct KnobActionChip: View {
    @EnvironmentObject private var model: AppModel
    let control: Control

    var body: some View {
        let isSelected = model.selected == control
        let isActive = model.pressed.contains(control)
        Button {
            model.selected = control
        } label: {
            HStack(spacing: 6) {
                Image(systemName: control.symbol)
                Text(model.action(for: control)?.label ?? "sin configurar")
                    .lineLimit(1)
            }
            .font(.callout)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule().fill(isActive ? Color.accentColor.opacity(0.5) : .white.opacity(isSelected ? 0.16 : 0.07))
            )
            .overlay(Capsule().strokeBorder(isSelected ? Color.accentColor : .clear, lineWidth: 2))
        }
        .buttonStyle(.plain)
        .help(control.title)
    }
}
