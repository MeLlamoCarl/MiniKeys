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
            id: "ai", title: "AI", subtitle: "Accept ↩ · Reject Esc · Voice, knob = ↑ ↓ and Tab",
            symbol: "sparkles",
            // Return accepts (send, approve a permission prompt), Esc rejects or interrupts, and
            // Dictation talks to the AI. The knob moves through options and earlier prompts; its
            // press is Tab, which accepts code suggestions and completions.
            config: [
                .key1: key(0x28), .key2: key(0x29), .key3: .media(.dictation),
                .knobLeft: key(0x52), .knobPress: key(0x2B), .knobRight: key(0x51)
            ]
        ),
        Preset(
            id: "games", title: "Games", subtitle: "Z · X · C, knob ← → and Space",
            symbol: "gamecontroller.fill",
            config: [
                .key1: key(0x1D), .key2: key(0x1B), .key3: key(0x06),
                .knobLeft: key(0x50), .knobPress: key(0x2C), .knobRight: key(0x4F)
            ]
        ),
        Preset(
            id: "media", title: "Media", subtitle: "Previous · Play · Next, knob = volume",
            symbol: "music.note",
            config: [
                .key1: .media(.previous), .key2: .media(.playPause), .key3: .media(.next),
                .knobLeft: .media(.volumeDown), .knobPress: .media(.mute), .knobRight: .media(.volumeUp)
            ]
        ),
        Preset(
            id: "edit", title: "Copy & Paste", subtitle: "⌘C · ⌘V · ⌘Z, knob = zoom",
            symbol: "doc.on.clipboard.fill",
            config: [
                .key1: key(0x06, .command), .key2: key(0x19, .command), .key3: key(0x1D, .command),
                .knobLeft: key(0x2D, .command), .knobPress: key(0x27, .command), .knobRight: key(0x2E, .command)
            ]
        ),
        Preset(
            id: "browse", title: "Browse", subtitle: "Back · Reload · Forward, knob = scroll",
            symbol: "safari.fill",
            config: [
                .key1: key(0x2F, .command), .key2: key(0x15, .command), .key3: key(0x30, .command),
                .knobLeft: .mouse(.scrollDown), .knobPress: .mouse(.middleClick), .knobRight: .mouse(.scrollUp)
            ]
        )
    ]
}
