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

    /// Makes a layer the active one. `A1` (even followed by a bare save) isn't enough: the keypad
    /// switches when a key binding of that layer is written, so its bindings are written again.
    static func activateLayer(_ layer: Int, config: LayerConfig) -> [[UInt8]] {
        let packets = Control.allCases.flatMap { control in
            config[control].map { bind($0, to: control, layer: layer) } ?? []
        }
        return packets.isEmpty ? [selectLayer(layer), commitKeys] : packets
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

    /// Changes the light right away without saving it: no flash wear, lost when the keypad is unplugged.
    static func previewLED(_ mode: LEDMode, layer: Int) -> [UInt8] {
        [ledTarget, UInt8(clamping: layer) << 4 | 0x08, UInt8(mode.rawValue)]
    }

    // MARK: MiniKeys firmware

    /// Applies light settings right away; `saveLight` stores them.
    static func light(_ settings: LightSettings) -> [[UInt8]] {
        let flags: UInt8 = (settings.multicolor ? 0x01 : 0) | (settings.flashesLayer ? 0x02 : 0)
        var packets: [[UInt8]] = [[
            0xB1, settings.effect.rawValue, settings.color.r, settings.color.g, settings.color.b,
            UInt8(clamping: settings.speed), UInt8(clamping: settings.brightness), flags
        ]]
        for (index, color) in settings.layerColors.prefix(3).enumerated() {
            packets.append([0xB3, UInt8(index + 1), color.r, color.g, color.b])
        }
        return packets
    }

    static let saveLight: [UInt8] = commitLED

    /// Live color for one key (1...3) or all keys (0), over the effect; not saved.
    static func keyColor(_ key: UInt8, _ color: RGB) -> [UInt8] {
        [0xB2, key, color.r, color.g, color.b]
    }

    static let clearKeyColors: [UInt8] = [0xB2, 0xFF]

    /// Restarts the light effect now (firmware 3+), to line it up with MiniKeys' preview.
    static let syncLightClock: [UInt8] = [0xB4]

    /// Firmware layers switch with `A1` alone, without writing the flash.
    static func selectLayerOnly(_ layer: Int) -> [[UInt8]] {
        [selectLayer(layer)]
    }

    static func setLED(_ mode: LEDMode, layer: Int) -> [[UInt8]] {
        let layerBits = UInt8(clamping: layer) << 4
        return [selectLayer(layer), [ledTarget, layerBits | 0x08, UInt8(mode.rawValue)], commitLED]
    }
}
