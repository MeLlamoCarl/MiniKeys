import Foundation

/// The physical controls of the 3-key + knob keypad. Raw values are the firmware's key numbers.
enum Control: Int, CaseIterable, Codable, Identifiable {
    case key1 = 1, key2 = 2, key3 = 3
    case knobLeft = 13, knobPress = 14, knobRight = 15

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .key1: "Key 1"
        case .key2: "Key 2"
        case .key3: "Key 3"
        case .knobLeft: "Knob · Turn Left"
        case .knobPress: "Knob · Press"
        case .knobRight: "Knob · Turn Right"
        }
    }

    var shortTitle: String {
        switch self {
        case .key1: "1"
        case .key2: "2"
        case .key3: "3"
        case .knobLeft: "Left"
        case .knobPress: "Press"
        case .knobRight: "Right"
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
        (.control, "⌃", "Control"), (.option, "⌥", "Option"), (.shift, "⇧", "Shift"), (.command, "⌘", "Command")
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
    /// "Voice Command": macOS starts Dictation (verified on the keypad).
    case dictation = 0xCF

    var title: String {
        switch self {
        case .playPause: "Play / Pause"
        case .previous: "Previous"
        case .next: "Next"
        case .volumeDown: "Volume Down"
        case .volumeUp: "Volume Up"
        case .mute: "Mute"
        case .brightnessDown: "Brightness Down"
        case .brightnessUp: "Brightness Up"
        case .dictation: "Dictation"
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
        case .dictation: "mic.fill"
        }
    }
}

enum MouseAction: String, CaseIterable, Codable {
    case leftClick, rightClick, middleClick, scrollUp, scrollDown

    var title: String {
        switch self {
        case .leftClick: "Left Click"
        case .rightClick: "Right Click"
        case .middleClick: "Middle Click"
        case .scrollUp: "Scroll up"
        case .scrollDown: "Scroll down"
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
        case .disabled: "Disabled"
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
        case .off: "Off"
        case .reactive: "On Press"
        case .on: "Color Wave"
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
