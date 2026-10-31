import Foundation

/// A key the keypad can send, identified by its USB HID usage (keyboard page 0x07).
struct KeyInfo: Identifiable, Hashable {
    enum Group: String, CaseIterable {
        case letters = "Letters"
        case numbers = "Numbers"
        case function = "Function Keys"
        case navigation = "Navigation"
        case editing = "Editing"
        case symbols = "Symbols"
        case keypad = "Numeric Keypad"
    }

    let usage: UInt8
    let name: String
    /// macOS virtual key code, used to translate a recorded key press.
    let macKeyCode: UInt16?
    let group: Group

    var id: UInt8 { usage }
}

enum KeyCatalog {
    static let all: [KeyInfo] = {
        var keys: [KeyInfo] = []
        let letters: [(String, UInt16)] = [
            ("A", 0x00), ("B", 0x0B), ("C", 0x08), ("D", 0x02), ("E", 0x0E), ("F", 0x03), ("G", 0x05),
            ("H", 0x04), ("I", 0x22), ("J", 0x26), ("K", 0x28), ("L", 0x25), ("M", 0x2E), ("N", 0x2D),
            ("O", 0x1F), ("P", 0x23), ("Q", 0x0C), ("R", 0x0F), ("S", 0x01), ("T", 0x11), ("U", 0x20),
            ("V", 0x09), ("W", 0x0D), ("X", 0x07), ("Y", 0x10), ("Z", 0x06)
        ]
        for (index, letter) in letters.enumerated() {
            keys.append(KeyInfo(usage: 0x04 + UInt8(index), name: letter.0, macKeyCode: letter.1, group: .letters))
        }
        let digits: [(String, UInt16)] = [
            ("1", 0x12), ("2", 0x13), ("3", 0x14), ("4", 0x15), ("5", 0x17),
            ("6", 0x16), ("7", 0x1A), ("8", 0x1C), ("9", 0x19), ("0", 0x1D)
        ]
        for (index, digit) in digits.enumerated() {
            keys.append(KeyInfo(usage: 0x1E + UInt8(index), name: digit.0, macKeyCode: digit.1, group: .numbers))
        }
        let functionCodes: [UInt16] = [0x7A, 0x78, 0x63, 0x76, 0x60, 0x61, 0x62, 0x64, 0x65, 0x6D, 0x67, 0x6F]
        for (index, code) in functionCodes.enumerated() {
            keys.append(KeyInfo(usage: 0x3A + UInt8(index), name: "F\(index + 1)", macKeyCode: code, group: .function))
        }
        let highFunctionCodes: [UInt16?] = [0x69, 0x6B, 0x71, 0x6A, 0x40, 0x4F, 0x50, 0x5A, nil, nil, nil, nil]
        for (index, code) in highFunctionCodes.enumerated() {
            keys.append(KeyInfo(usage: 0x68 + UInt8(index), name: "F\(index + 13)", macKeyCode: code, group: .function))
        }
        keys += [
            KeyInfo(usage: 0x28, name: "↩ Return", macKeyCode: 0x24, group: .editing),
            KeyInfo(usage: 0x29, name: "Esc", macKeyCode: 0x35, group: .editing),
            KeyInfo(usage: 0x2A, name: "⌫ Delete", macKeyCode: 0x33, group: .editing),
            KeyInfo(usage: 0x4C, name: "⌦ Forward Delete", macKeyCode: 0x75, group: .editing),
            KeyInfo(usage: 0x2B, name: "⇥ Tab", macKeyCode: 0x30, group: .editing),
            KeyInfo(usage: 0x2C, name: "Space", macKeyCode: 0x31, group: .editing),
            KeyInfo(usage: 0x39, name: "⇪ Caps Lock", macKeyCode: 0x39, group: .editing),
            KeyInfo(usage: 0x49, name: "Insert", macKeyCode: 0x72, group: .editing),
            KeyInfo(usage: 0x46, name: "Print Screen", macKeyCode: nil, group: .editing),
            KeyInfo(usage: 0x52, name: "↑", macKeyCode: 0x7E, group: .navigation),
            KeyInfo(usage: 0x51, name: "↓", macKeyCode: 0x7D, group: .navigation),
            KeyInfo(usage: 0x50, name: "←", macKeyCode: 0x7B, group: .navigation),
            KeyInfo(usage: 0x4F, name: "→", macKeyCode: 0x7C, group: .navigation),
            KeyInfo(usage: 0x4A, name: "Home", macKeyCode: 0x73, group: .navigation),
            KeyInfo(usage: 0x4D, name: "End", macKeyCode: 0x77, group: .navigation),
            KeyInfo(usage: 0x4B, name: "Page Up", macKeyCode: 0x74, group: .navigation),
            KeyInfo(usage: 0x4E, name: "Page Down", macKeyCode: 0x79, group: .navigation),
            KeyInfo(usage: 0x2D, name: "-", macKeyCode: 0x1B, group: .symbols),
            KeyInfo(usage: 0x2E, name: "=", macKeyCode: 0x18, group: .symbols),
            KeyInfo(usage: 0x2F, name: "[", macKeyCode: 0x21, group: .symbols),
            KeyInfo(usage: 0x30, name: "]", macKeyCode: 0x1E, group: .symbols),
            KeyInfo(usage: 0x31, name: "\\", macKeyCode: 0x2A, group: .symbols),
            KeyInfo(usage: 0x33, name: ";", macKeyCode: 0x29, group: .symbols),
            KeyInfo(usage: 0x34, name: "'", macKeyCode: 0x27, group: .symbols),
            KeyInfo(usage: 0x35, name: "`", macKeyCode: 0x32, group: .symbols),
            KeyInfo(usage: 0x36, name: ",", macKeyCode: 0x2B, group: .symbols),
            KeyInfo(usage: 0x37, name: ".", macKeyCode: 0x2F, group: .symbols),
            KeyInfo(usage: 0x38, name: "/", macKeyCode: 0x2C, group: .symbols),
            KeyInfo(usage: 0x64, name: "<", macKeyCode: 0x0A, group: .symbols)
        ]
        let keypadCodes: [UInt16] = [0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5B, 0x5C, 0x52]
        for (index, code) in keypadCodes.enumerated() {
            keys.append(KeyInfo(usage: 0x59 + UInt8(index), name: "Num \((index + 1) % 10)", macKeyCode: code, group: .keypad))
        }
        keys += [
            KeyInfo(usage: 0x54, name: "Num /", macKeyCode: 0x4B, group: .keypad),
            KeyInfo(usage: 0x55, name: "Num *", macKeyCode: 0x43, group: .keypad),
            KeyInfo(usage: 0x56, name: "Num -", macKeyCode: 0x4E, group: .keypad),
            KeyInfo(usage: 0x57, name: "Num +", macKeyCode: 0x45, group: .keypad),
            KeyInfo(usage: 0x58, name: "Num ↩", macKeyCode: 0x4C, group: .keypad),
            KeyInfo(usage: 0x63, name: "Num .", macKeyCode: 0x41, group: .keypad)
        ]
        return keys
    }()

    private static let byUsage = Dictionary(all.map { ($0.usage, $0) }, uniquingKeysWith: { first, _ in first })
    private static let byMacKeyCode = Dictionary(
        all.compactMap { key in key.macKeyCode.map { ($0, key) } },
        uniquingKeysWith: { first, _ in first }
    )

    static func key(usage: UInt8) -> KeyInfo? { byUsage[usage] }
    static func key(macKeyCode: UInt16) -> KeyInfo? { byMacKeyCode[macKeyCode] }

    static func name(usage: UInt8) -> String {
        byUsage[usage]?.name ?? String(format: "0x%02X", usage)
    }
}
