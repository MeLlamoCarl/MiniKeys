import Foundation

/// A named set of bindings. MiniKeys keeps up to 30; the selected one is written to the keypad,
/// which runs it until another one is chosen. With the MiniKeys firmware the first 3 are saved on
/// the keypad, which switches between them itself (press and turn the knob).
struct KeypadLayer: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var color: RGB
    var config: LayerConfig = [:]

    static let maxCount = 30

    /// Colors given to new layers, in turn.
    static let palette = [
        RGB(r: 0, g: 122, b: 255), RGB(r: 52, g: 199, b: 89), RGB(r: 255, g: 149, b: 0),
        RGB(r: 175, g: 82, b: 222), RGB(r: 255, g: 45, b: 85), RGB(r: 90, g: 200, b: 250),
        RGB(r: 255, g: 204, b: 0), RGB(r: 88, g: 86, b: 214)
    ]
}

/// A preset made by the user from a layer. Presets can be exported to a file and imported by
/// other people.
struct CustomPreset: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var symbol: String
    var config: LayerConfig

    /// SF Symbols offered for custom presets.
    static let symbols = [
        "star.fill", "gamecontroller.fill", "paintbrush.pointed.fill", "pencil.and.ruler.fill",
        "music.note", "video.fill", "camera.fill", "terminal.fill", "keyboard.fill", "bolt.fill",
        "flag.fill", "heart.fill", "cube.fill", "wand.and.stars"
    ]

    var preset: Preset {
        Preset(id: id.uuidString, title: title, subtitle: Self.summary(of: config), symbol: symbol, config: config)
    }

    /// "Space · ↑ · Esc, knob = ← → and ↩", from the bindings.
    static func summary(of config: LayerConfig) -> String {
        func label(_ control: Control) -> String { config[control]?.label ?? "—" }
        return "\(label(.key1)) · \(label(.key2)) · \(label(.key3)), knob \(label(.knobLeft)) \(label(.knobRight))"
    }
}

/// File format for sharing a preset (`.minikeys-preset`, JSON).
struct PresetFile: Codable {
    var format = "minikeys-preset"
    var version = 1
    var title: String
    var symbol: String
    var bindings: [Binding]

    struct Binding: Codable {
        var control: Control
        var action: Action
    }

    init(_ preset: CustomPreset) {
        title = preset.title
        symbol = preset.symbol
        bindings = Control.allCases.compactMap { control in
            preset.config[control].map { Binding(control: control, action: $0) }
        }
    }

    var customPreset: CustomPreset {
        var config: LayerConfig = [:]
        for binding in bindings { config[binding.control] = binding.action }
        let symbol = CustomPreset.symbols.contains(self.symbol) ? self.symbol : "star.fill"
        return CustomPreset(title: String(title.prefix(40)), symbol: symbol, config: config)
    }
}
