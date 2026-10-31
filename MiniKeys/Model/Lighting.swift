import AppKit
import SwiftUI

/// An 8-bit RGB color, as the keypad's LEDs take it.
struct RGB: Codable, Hashable {
    var r: UInt8
    var g: UInt8
    var b: UInt8

    static let white = RGB(r: 255, g: 255, b: 255)

    var color: Color {
        Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }

    init(r: UInt8, g: UInt8, b: UInt8) {
        self.r = r
        self.g = g
        self.b = b
    }

    init(_ color: Color) {
        let ns = NSColor(color).usingColorSpace(.sRGB) ?? .white
        func byte(_ value: CGFloat) -> UInt8 { UInt8(clamping: Int((min(max(value, 0), 1) * 255).rounded())) }
        self.init(r: byte(ns.redComponent), g: byte(ns.greenComponent), b: byte(ns.blueComponent))
    }
}

/// Light effects of the MiniKeys firmware. Raw values are the firmware's effect numbers.
enum FirmwareEffect: UInt8, CaseIterable, Codable {
    case off = 0, press = 1, wave = 2, solid = 3, breathe = 4, rainbow = 5, layer = 6

    var title: String {
        switch self {
        case .off: "Off"
        case .press: "On Press"
        case .wave: "Color Wave"
        case .solid: "Solid"
        case .breathe: "Breathing"
        case .rainbow: "Rainbow"
        case .layer: "Layer Color"
        }
    }

    var symbol: String {
        switch self {
        case .off: "lightbulb.slash"
        case .press: "hand.tap"
        case .wave: "wave.3.right"
        case .solid: "circle.fill"
        case .breathe: "lungs"
        case .rainbow: "rainbow"
        case .layer: "square.3.layers.3d"
        }
    }

    var usesColor: Bool { [.press, .wave, .solid, .breathe].contains(self) }
    var canCycleColors: Bool { self == .press || self == .wave }
    var usesSpeed: Bool { [.press, .wave, .breathe, .rainbow].contains(self) }
}

/// Light settings of the MiniKeys firmware.
struct LightSettings: Codable, Equatable {
    var effect: FirmwareEffect = .wave
    var color: RGB = .white
    /// Cycle through colors instead of using `color` (on press and wave).
    var multicolor = true
    var speed = 5                       // 1...10
    var brightness = 160                // 0...255
    /// Blink the layer number in the layer's color when switching layers.
    var flashesLayer = true
    var layerColors = [RGB(r: 0, g: 120, b: 255), RGB(r: 0, g: 255, b: 80), RGB(r: 255, g: 60, b: 0)]
}
