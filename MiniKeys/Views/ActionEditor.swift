import AppKit
import SwiftUI

/// Edits what the selected control does on the active layer. Every change is written to the keypad
/// right away.
struct ActionEditor: View {
    @EnvironmentObject private var model: AppModel

    enum Kind: String, CaseIterable, Identifiable {
        case keys = "Teclado"
        case media = "Multimedia"
        case mouse = "Ratón"
        case disabled = "Nada"

        var id: String { rawValue }

        init(_ action: Action?) {
            switch action {
            case .media: self = .media
            case .mouse: self = .mouse
            case .disabled: self = .disabled
            case .keys, nil: self = .keys
            }
        }
    }

    @State private var kind: Kind = .keys

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 10) {
                    Image(systemName: model.selected.symbol)
                        .font(.title3)
                        .foregroundStyle(Color.accentColor)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(model.selected.title)
                            .font(.headline)
                        Text(model.action(for: model.selected).map { "Ahora: \($0.label)" } ?? "Aún no configurada desde MiniKeys")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                Picker("Tipo", selection: $kind) {
                    ForEach(Kind.allCases) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
                .labelsHidden()

                switch kind {
                case .keys: KeyboardEditor(control: model.selected)
                case .media: MediaEditor(control: model.selected)
                case .mouse: MouseEditor(control: model.selected)
                case .disabled: DisabledEditor(control: model.selected)
                }
            }
        }
        .onAppear { kind = Kind(model.action(for: model.selected)) }
        .onChange(of: model.selected) { control in kind = Kind(model.action(for: control)) }
        .onChange(of: model.activeLayer) { _ in kind = Kind(model.action(for: model.selected)) }
    }
}

// MARK: - Keyboard

private struct KeyboardEditor: View {
    @EnvironmentObject private var model: AppModel
    let control: Control

    @StateObject private var recorder = ShortcutRecorder()

    private var strokes: [KeyStroke] {
        if case .keys(let strokes) = model.action(for: control) { return strokes }
        return []
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            recordField

            HStack(spacing: 8) {
                Button {
                    recorder.start(appending: true) { commit(strokes + [$0]) }
                } label: {
                    Label("Agregar otra tecla", systemImage: "plus")
                }
                .disabled(strokes.isEmpty || strokes.count >= Action.maxStrokes || recorder.isRecording)
                .help("Crea una secuencia: el teclado enviará las teclas una tras otra (máx. \(Action.maxStrokes))")

                keyMenu

                Spacer()

                if !strokes.isEmpty {
                    Button(role: .destructive) {
                        commit(Array(strokes.dropLast()))
                    } label: {
                        Label("Quitar última", systemImage: "delete.left")
                    }
                }
            }

            if let last = strokes.last {
                HStack(spacing: 6) {
                    Text("Modificadores de \(last.key == 0 ? "la tecla" : KeyCatalog.name(usage: last.key)):")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    ForEach(Modifiers.ordered, id: \.1) { modifier, symbol, name in
                        Toggle(isOn: Binding(
                            get: { last.modifiers.contains(modifier) },
                            set: { isOn in
                                var updated = strokes
                                if isOn {
                                    updated[updated.count - 1].modifiers.insert(modifier)
                                } else {
                                    updated[updated.count - 1].modifiers.remove(modifier)
                                }
                                commit(updated)
                            }
                        )) {
                            Text(symbol).font(.system(size: 15, weight: .semibold)).frame(width: 22)
                        }
                        .toggleStyle(.button)
                        .help(name)
                    }
                }
            }

            Text("Haz clic en el recuadro y presiona la tecla o combinación en el teclado del Mac. Para teclas que no tienes (F13–F24, teclado numérico…) usa «Elegir tecla».")
                .font(.caption)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .onChange(of: control) { _ in recorder.stop() }
        .onDisappear { recorder.stop() }
    }

    private var recordField: some View {
        Button {
            if recorder.isRecording {
                recorder.stop()
            } else {
                recorder.start(appending: false) { commit([$0]) }
            }
        } label: {
            HStack(spacing: 8) {
                if recorder.isRecording {
                    Image(systemName: "record.circle")
                        .foregroundStyle(.red)
                    Text(recorder.appending ? "Presiona la siguiente tecla…" : "Presiona la combinación…")
                        .foregroundStyle(.secondary)
                } else if strokes.isEmpty {
                    Image(systemName: "keyboard")
                        .foregroundStyle(.secondary)
                    Text("Haz clic para grabar un atajo")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(Array(strokes.enumerated()), id: \.offset) { index, stroke in
                        if index > 0 {
                            Image(systemName: "arrow.right").font(.caption).foregroundStyle(.secondary)
                        }
                        Text(stroke.display)
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(RoundedRectangle(cornerRadius: 6).fill(Color.primary.opacity(0.08)))
                    }
                }
                Spacer()
                if recorder.isRecording {
                    Text("Clic para cancelar").font(.caption).foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(nsColor: .textBackgroundColor))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(recorder.isRecording ? Color.accentColor : Color.primary.opacity(0.15), lineWidth: recorder.isRecording ? 2 : 1)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.pressable)
    }

    private var keyMenu: some View {
        Menu {
            ForEach(KeyInfo.Group.allCases, id: \.self) { group in
                Menu(group.rawValue) {
                    ForEach(KeyCatalog.all.filter { $0.group == group }) { key in
                        Button(key.name) {
                            var updated = strokes
                            if updated.isEmpty {
                                updated = [KeyStroke(modifiers: [], key: key.usage)]
                            } else {
                                updated[updated.count - 1].key = key.usage
                            }
                            commit(updated)
                        }
                    }
                }
            }
        } label: {
            Label("Elegir tecla", systemImage: "list.bullet")
        }
        .fixedSize()
        .help(strokes.isEmpty ? "Elige una tecla de la lista" : "Reemplaza la última tecla")
    }

    private func commit(_ strokes: [KeyStroke]) {
        model.setAction(.keys(strokes), for: control)
    }
}

/// Captures one key press (with modifiers) from the Mac keyboard while the app is active.
final class ShortcutRecorder: ObservableObject {
    @Published private(set) var isRecording = false
    @Published private(set) var appending = false

    private var monitor: Any?
    private var pendingModifiers: Modifiers = []
    private var handler: ((KeyStroke) -> Void)?

    func start(appending: Bool, handler: @escaping (KeyStroke) -> Void) {
        stop()
        self.appending = appending
        self.handler = handler
        isRecording = true
        monitor = NSEvent.addLocalMonitorForEvents(matching: [.keyDown, .flagsChanged]) { [weak self] event in
            self?.handle(event)
            return nil
        }
    }

    func stop() {
        if let monitor { NSEvent.removeMonitor(monitor) }
        monitor = nil
        handler = nil
        pendingModifiers = []
        isRecording = false
    }

    private func handle(_ event: NSEvent) {
        let modifiers = Self.modifiers(from: event.modifierFlags)
        switch event.type {
        case .keyDown:
            guard let key = KeyCatalog.key(macKeyCode: event.keyCode) else { NSSound.beep(); return }
            finish(KeyStroke(modifiers: modifiers, key: key.usage))
        case .flagsChanged:
            // Releasing modifiers without pressing a key records the modifiers alone.
            if modifiers.isEmpty, !pendingModifiers.isEmpty {
                finish(KeyStroke(modifiers: pendingModifiers, key: 0))
            } else {
                pendingModifiers.formUnion(modifiers)
            }
        default:
            break
        }
    }

    private func finish(_ stroke: KeyStroke) {
        let handler = handler
        stop()
        handler?(stroke)
    }

    private static func modifiers(from flags: NSEvent.ModifierFlags) -> Modifiers {
        var modifiers: Modifiers = []
        if flags.contains(.control) { modifiers.insert(.control) }
        if flags.contains(.option) { modifiers.insert(.option) }
        if flags.contains(.shift) { modifiers.insert(.shift) }
        if flags.contains(.command) { modifiers.insert(.command) }
        return modifiers
    }
}

// MARK: - Media, mouse, disabled

private struct MediaEditor: View {
    @EnvironmentObject private var model: AppModel
    let control: Control

    var body: some View {
        TileGrid(items: MediaKey.allCases, title: \.title, symbol: \.symbol, isSelected: { model.action(for: control) == .media($0) }) {
            model.setAction(.media($0), for: control)
        }
    }
}

private struct MouseEditor: View {
    @EnvironmentObject private var model: AppModel
    let control: Control

    var body: some View {
        TileGrid(items: MouseAction.allCases, title: \.title, symbol: \.symbol, isSelected: { model.action(for: control) == .mouse($0) }) {
            model.setAction(.mouse($0), for: control)
        }
    }
}

private struct DisabledEditor: View {
    @EnvironmentObject private var model: AppModel
    let control: Control

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("La tecla no enviará nada al presionarla.")
                .foregroundStyle(.secondary)
            Button {
                model.setAction(.disabled, for: control)
            } label: {
                Label(model.action(for: control) == .disabled ? "Desactivada" : "Desactivar", systemImage: "nosign")
            }
            .disabled(model.action(for: control) == .disabled)
        }
    }
}

private struct TileGrid<Item: Hashable>: View {
    let items: [Item]
    let title: KeyPath<Item, String>
    let symbol: KeyPath<Item, String>
    let isSelected: (Item) -> Bool
    let action: (Item) -> Void

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 112), spacing: 10)], spacing: 10) {
            ForEach(items, id: \.self) { item in
                let selected = isSelected(item)
                Button {
                    action(item)
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: item[keyPath: symbol])
                            .font(.system(size: 20, weight: .semibold))
                        Text(item[keyPath: title])
                            .font(.callout)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(selected ? Color.accentColor.opacity(0.18) : Color.primary.opacity(0.05))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(selected ? Color.accentColor : .clear, lineWidth: 2)
                    )
                    .contentShape(Rectangle())
                }
                .buttonStyle(.pressable)
            }
        }
    }
}
