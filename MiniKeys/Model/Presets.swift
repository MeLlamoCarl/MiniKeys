import Foundation

struct Preset: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let symbol: String
    let config: LayerConfig
}

private func key(_ usage: UInt8, _ modifiers: Modifiers = []) -> Action {
    .keys([KeyStroke(modifiers: modifiers, key: usage)])
}

enum Presets {
    static let all: [Preset] = [
        Preset(
            id: "games", title: "Juegos", subtitle: "Z · X · C, perilla ← → y Espacio",
            symbol: "gamecontroller.fill",
            config: [
                .key1: key(0x1D), .key2: key(0x1B), .key3: key(0x06),
                .knobLeft: key(0x50), .knobPress: key(0x2C), .knobRight: key(0x4F)
            ]
        ),
        Preset(
            id: "media", title: "Multimedia", subtitle: "Anterior · Play · Siguiente, perilla = volumen",
            symbol: "music.note",
            config: [
                .key1: .media(.previous), .key2: .media(.playPause), .key3: .media(.next),
                .knobLeft: .media(.volumeDown), .knobPress: .media(.mute), .knobRight: .media(.volumeUp)
            ]
        ),
        Preset(
            id: "edit", title: "Copiar y pegar", subtitle: "⌘C · ⌘V · ⌘Z, perilla = zoom",
            symbol: "doc.on.clipboard.fill",
            config: [
                .key1: key(0x06, .command), .key2: key(0x19, .command), .key3: key(0x1D, .command),
                .knobLeft: key(0x2D, .command), .knobPress: key(0x27, .command), .knobRight: key(0x2E, .command)
            ]
        ),
        Preset(
            id: "browse", title: "Navegar", subtitle: "Atrás · Recargar · Adelante, perilla = desplazar",
            symbol: "safari.fill",
            config: [
                .key1: key(0x2F, .command), .key2: key(0x15, .command), .key3: key(0x30, .command),
                .knobLeft: .mouse(.scrollDown), .knobPress: .mouse(.middleClick), .knobRight: .mouse(.scrollUp)
            ]
        )
    ]
}
