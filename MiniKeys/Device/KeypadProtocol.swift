import Foundation

/// Command packets for the CH57x "MINI KeyBoard" (USB 1189:8890), reverse engineered from the vendor
/// tool. Each packet is sent as a 65-byte interrupt transfer: report ID 3 + 64 bytes, zero padded.
enum KeypadProtocol {
    private static let commitKeys: [UInt8] = [0xAA, 0xAA]
    private static let commitLED: [UInt8] = [0xAA, 0xA1]
    private static let ledTarget: UInt8 = 0xB0

    /// Layers are numbered 1...3 by the firmware.
    static func selectLayer(_ layer: Int) -> [UInt8] {
        [0xA1, UInt8(clamping: layer)]
    }

    static func bind(_ action: Action, to control: Control, layer: Int) -> [[UInt8]] {
        let key = UInt8(control.rawValue)
        let layerBits = UInt8(clamping: layer) << 4
        var packets = [selectLayer(layer)]
        switch action {
        case .keys(let strokes):
            let strokes = Array(strokes.prefix(Action.maxStrokes))
            let count = UInt8(strokes.count)
            let header: [UInt8] = [key, layerBits | 0x01, count]
            // Index 0 carries the first stroke's modifiers alone, then one packet per stroke.
            packets.append(header + [0, strokes.first?.modifiers.rawValue ?? 0, 0])
            for (index, stroke) in strokes.enumerated() {
                packets.append(header + [UInt8(index + 1), stroke.modifiers.rawValue, stroke.key])
            }
        case .disabled:
            packets.append([key, layerBits | 0x01, 0, 0, 0, 0])
        case .media(let media):
            packets.append([key, layerBits | 0x02, UInt8(media.rawValue & 0xFF), UInt8(media.rawValue >> 8)])
        case .mouse(let mouse):
            packets.append([key, layerBits | 0x03] + mouse.payload)
        }
        packets.append(commitKeys)
        return packets
    }

    static func setLED(_ mode: LEDMode, layer: Int) -> [[UInt8]] {
        let layerBits = UInt8(clamping: layer) << 4
        return [selectLayer(layer), [ledTarget, layerBits | 0x08, UInt8(mode.rawValue)], commitLED]
    }
}
