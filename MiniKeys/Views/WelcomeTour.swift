import SwiftUI

/// The welcome tour: one popover per part of the window, in order. Shown on first launch and
/// from Help › Welcome Tour.
enum TourStep: Int, CaseIterable, Identifiable {
    case keypad, editor, presets, layers, light, firmware, save

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .keypad: "Your Keypad"
        case .editor: "Choose What It Does"
        case .presets: "Presets"
        case .layers: "Layers"
        case .light: "Light"
        case .firmware: "Keypad Firmware"
        case .save: "Save to Keypad"
        }
    }

    var symbol: String {
        switch self {
        case .keypad: "keyboard"
        case .editor: "command"
        case .presets: "square.grid.2x2"
        case .layers: "square.3.layers.3d"
        case .light: "rainbow"
        case .firmware: "memorychip"
        case .save: "checkmark.circle"
        }
    }

    /// Steps inside the scrolling detail view, which scrolls to them first.
    var isInDetail: Bool { self != .layers && self != .save }

    func message(firmware: Bool) -> Text {
        switch self {
        case .keypad:
            Text("This is your keypad as it is right now, with its light. Click a key, or a knob chip (turn left, press, turn right), to choose what it does. Press the real keypad and the press shows up here.")
        case .editor:
            Text("Record a shortcut by pressing it on the Mac keyboard, chain up to 5 keys, or pick media keys, mouse clicks and scrolling. Every change is saved on the keypad right away, so it works on any computer without MiniKeys.")
        case .presets:
            Text("A preset sets up the whole layer in one click. Save your own layer as a preset, and right-click it to export a .minikeys-preset file you can share or import.")
        case .layers:
            firmware
                ? Text("Keep up to 30 layers. The first 3, marked with \(Image(systemName: "keyboard")), live in the keypad's memory: press the knob and turn it to switch between them, even without the Mac, and MiniKeys follows. Drag layers to choose which 3. The rest are sent to the keypad when you select them.")
                : Text("Keep up to 30 layers and click one to send it to the keypad. With the MiniKeys firmware, the first 3 live in the keypad's memory and you switch them by pressing and turning the knob.")
        case .light:
            firmware
                ? Text("Pick an effect, its colors, speed and brightness; the preview matches the keypad. \"Show layer color on switch\" blinks the new layer's number in its color.")
                : Text("Pick one of the keypad's light modes. The MiniKeys firmware adds more effects, any color, speed and brightness.")
        case .firmware:
            firmware
                ? Text("Shows the firmware on the keypad. \"Switch layers with the knob\" turns the press-and-turn gesture on or off; while it's on, a knob press acts when you let go. Update Firmware opens the installer guide.")
                : Text("Shows the firmware on the keypad. The optional MiniKeys firmware adds light effects and 3 layers you switch on the keypad; its installer updates it over USB, without opening the keypad.")
        case .save:
            Text("Changes are already saved as you make them. This button writes the current layer to the keypad again, for example after the keypad was set up on another computer (⇧⌘R). MiniKeys is also in the menu bar.")
        }
    }
}

extension View {
    /// Shows this tour step's popover, pointing at the view.
    func tourStop(_ step: TourStep, arrowEdge: Edge = .bottom) -> some View {
        modifier(TourStop(step: step, arrowEdge: arrowEdge))
    }
}

private struct TourStop: ViewModifier {
    @EnvironmentObject private var model: AppModel
    let step: TourStep
    let arrowEdge: Edge

    func body(content: Content) -> some View {
        content
            .id(step)
            .popover(isPresented: Binding(
                get: { model.tourPopover == step },
                // Clicking outside or pressing Esc closes the popover, which ends the tour.
                set: { if !$0, model.tourPopover == step { model.tourPopoverClosed(step) } }
            ), arrowEdge: arrowEdge) {
                TourCard(step: step)
            }
    }
}

private struct TourCard: View {
    @EnvironmentObject private var model: AppModel
    let step: TourStep

    private var steps: [TourStep] { TourStep.allCases }
    private var isLast: Bool { step == steps.last }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(step.title).font(.headline)
            } icon: {
                Image(systemName: step.symbol).foregroundStyle(.tint)
            }
            step.message(firmware: model.savedLayerCount > 0)
                .fixedSize(horizontal: false, vertical: true)
            HStack {
                Text("\(step.rawValue + 1) of \(steps.count)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                if !isLast {
                    Button("Skip Tour") { model.endTour() }
                }
                if let previous = TourStep(rawValue: step.rawValue - 1) {
                    Button("Back") { model.showTourStep(previous) }
                }
                Button(isLast ? "Done" : "Next") {
                    if let next = TourStep(rawValue: step.rawValue + 1) {
                        model.showTourStep(next)
                    } else {
                        model.endTour()
                    }
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding(16)
        .frame(width: 340)
    }
}

/// First launch: what MiniKeys does, and an invitation to the tour.
struct WelcomeSheet: View {
    @EnvironmentObject private var model: AppModel

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 6) {
                Image(nsImage: NSApp.applicationIconImage)
                    .resizable()
                    .frame(width: 96, height: 96)
                Text("Welcome to MiniKeys")
                    .font(.largeTitle.bold())
                Text("Set up your mini keypad from your Mac.")
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 14) {
                feature("command", "Any action on any key",
                        "Shortcuts, key sequences, media keys and the mouse, on the 3 keys and the knob.")
                feature("square.3.layers.3d", "Layers",
                        "Up to 30, with 3 saved on the keypad that you switch with the knob.")
                feature("rainbow", "Light",
                        "Effects and colors, previewed live on screen.")
            }
            .frame(maxWidth: 380, alignment: .leading)
            HStack {
                Button("Not Now") {
                    model.endTour()
                    model.sheet = nil
                }
                .keyboardShortcut(.cancelAction)
                Button("Take the Tour") {
                    model.sheet = nil
                    // After the sheet has closed, so the first popover has its window to itself.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { model.startTour() }
                }
                .keyboardShortcut(.defaultAction)
            }
            .controlSize(.large)
        }
        .padding(32)
        .frame(width: 460)
    }

    private func feature(_ symbol: String, _ title: String, _ detail: String) -> some View {
        Label {
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.headline)
                Text(detail)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        } icon: {
            Image(systemName: symbol)
                .font(.title2)
                .foregroundStyle(.tint)
                .frame(width: 32)
        }
    }
}

/// Opens the main window if needed and starts the tour (Help menu and the menu bar).
struct TourMenuButton: View {
    @EnvironmentObject private var model: AppModel
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        Button("Welcome Tour") {
            openWindow(id: "main")
            NSApp.activate(ignoringOtherApps: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { model.startTour() }
        }
    }
}
