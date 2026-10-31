import Foundation

/// The physical controls of the 3-key + knob keypad. Raw values are the firmware's key numbers.
enum Control: Int, CaseIterable, Codable, Identifiable {
    case key1 = 1, key2 = 2, key3 = 3
    case knobLeft = 13, knobPress = 14, knobRight = 15

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .key1: "Tecla 1"
        case .key2: "Tecla 2"
        case .key3: "Tecla 3"
        case .knobLeft: "Perilla · girar a la izquierda"
        case .knobPress: "Perilla · presionar"
        case .knobRight: "Perilla · girar a la derecha"
        }
    }

    var shortTitle: String {
        switch self {
        case .key1: "1"
        case .key2: "2"
        case .key3: "3"
        case .knobLeft: "Izquierda"
        case .knobPress: "Presionar"
        case .knobRight: "Derecha"
        }
    }

    var symbol: String {
        switch self {
        case .key1: "1.square"
        case .key2: "2.square"
        case .key3: "3.square"
        case .knobLeft: "arrow.counterclockwise"
        case .knobPress: "smallcircle.filled.circle"
        case .knobRight: "arrow.clockwise"
        }
    }

    var isRotation: Bool { self == .knobLeft || self == .knobRight }
}

/// HID modifier bits as the firmware expects them (left-hand modifiers).
struct Modifiers: OptionSet, Codable, Hashable {
    let rawValue: UInt8
    static let control = Modifiers(rawValue: 0x01)
    static let shift = Modifiers(rawValue: 0x02)
    static let option = Modifiers(rawValue: 0x04)
    static let command = Modifiers(rawValue: 0x08)

    static let ordered: [(Modifiers, String, String)] = [
        (.control, "⌃", "Control"), (.option, "⌥", "Opción"), (.shift, "⇧", "Mayúsculas"), (.command, "⌘", "Comando")
    ]

    var symbols: String {
        Self.ordered.filter { contains($0.0) }.map(\.1).joined()
    }
}

/// One key press, optionally with modifiers. `key == 0` means "modifiers only".
struct KeyStroke: Codable, Hashable {
    var modifiers: Modifiers
    var key: UInt8

    var display: String {
        let keyName = key == 0 ? "" : KeyCatalog.name(usage: key)
        let text = modifiers.symbols + keyName
        return text.isEmpty ? "—" : text
    }
}

enum MediaKey: UInt16, CaseIterable, Codable {
    case playPause = 0xCD
    case previous = 0xB6
    case next = 0xB5
    case volumeDown = 0xEA
    case volumeUp = 0xE9
    case mute = 0xE2
    case brightnessDown = 0x70
    case brightnessUp = 0x6F

    var title: String {
        switch self {
        case .playPause: "Reproducir / Pausa"
        case .previous: "Anterior"
        case .next: "Siguiente"
        case .volumeDown: "Bajar volumen"
        case .volumeUp: "Subir volumen"
        case .mute: "Silenciar"
        case .brightnessDown: "Bajar brillo"
        case .brightnessUp: "Subir brillo"
        }
    }

    var symbol: String {
        switch self {
        case .playPause: "playpause.fill"
        case .previous: "backward.fill"
        case .next: "forward.fill"
        case .volumeDown: "speaker.wave.1.fill"
        case .volumeUp: "speaker.wave.3.fill"
        case .mute: "speaker.slash.fill"
        case .brightnessDown: "sun.min.fill"
        case .brightnessUp: "sun.max.fill"
        }
    }
}

enum MouseAction: String, CaseIterable, Codable {
    case leftClick, rightClick, middleClick, scrollUp, scrollDown

    var title: String {
        switch self {
        case .leftClick: "Clic izquierdo"
        case .rightClick: "Clic derecho"
        case .middleClick: "Clic central"
        case .scrollUp: "Rueda arriba"
        case .scrollDown: "Rueda abajo"
        }
    }

    var symbol: String {
        switch self {
        case .leftClick: "computermouse.fill"
        case .rightClick: "contextualmenu.and.cursorarrow"
        case .middleClick: "circle.circle"
        case .scrollUp: "chevron.up.circle.fill"
        case .scrollDown: "chevron.down.circle.fill"
        }
    }

    /// Firmware payload: buttons, x, y, wheel, modifiers.
    var payload: [UInt8] {
        switch self {
        case .leftClick: [0x01, 0, 0, 0, 0]
        case .rightClick: [0x02, 0, 0, 0, 0]
        case .middleClick: [0x04, 0, 0, 0, 0]
        case .scrollUp: [0, 0, 0, 0x01, 0]
        case .scrollDown: [0, 0, 0, 0xFF, 0]
        }
    }
}

enum Action: Codable, Hashable {
    case keys([KeyStroke])
    case media(MediaKey)
    case mouse(MouseAction)
    case disabled

    static let maxStrokes = 5

    var label: String {
        switch self {
        case .keys(let strokes): strokes.isEmpty ? "—" : strokes.map(\.display).joined(separator: " ")
        case .media(let media): media.title
        case .mouse(let mouse): mouse.title
        case .disabled: "Desactivada"
        }
    }

    /// SF Symbol shown instead of text on the keycap, when there is a natural one.
    var symbol: String? {
        switch self {
        case .media(let media): media.symbol
        case .mouse(let mouse): mouse.symbol
        case .disabled: "nosign"
        case .keys: nil
        }
    }
}

enum LEDMode: Int, CaseIterable, Codable {
    case off = 0, reactive = 1, on = 2

    var title: String {
        switch self {
        case .off: "Apagado"
        case .reactive: "Al presionar"
        case .on: "Ola de colores"
        }
    }

    var symbol: String {
        switch self {
        case .off: "lightbulb.slash"
        case .reactive: "hand.tap"
        case .on: "wave.3.right"
        }
    }
}

typealias LayerConfig = [Control: Action]
