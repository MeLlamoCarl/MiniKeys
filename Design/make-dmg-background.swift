// Renders the DMG window background (560×360 pt, @1x and @2x), matching the app icon.
// Run: swiftc -o /tmp/bg Design/make-dmg-background.swift && /tmp/bg <out folder>, then
// tiffutil -cathidpicheck <out>/background.png <out>/background@2x.png -out Design/DMG/background.tiff
import AppKit
import SwiftUI

let out = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)

let glowColors: [Color] = [
    Color(red: 1.00, green: 0.22, blue: 0.45), Color(red: 1.00, green: 0.55, blue: 0.10),
    Color(red: 0.95, green: 0.85, blue: 0.15), Color(red: 0.20, green: 0.85, blue: 0.40),
    Color(red: 0.10, green: 0.75, blue: 0.95), Color(red: 0.25, green: 0.40, blue: 1.00),
    Color(red: 0.70, green: 0.30, blue: 1.00)
]

struct Background: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.10, green: 0.10, blue: 0.16), Color(red: 0.03, green: 0.03, blue: 0.07)],
                startPoint: .top, endPoint: .bottom
            )
            // RGB underglow behind the two icons, like the light under the keypad.
            LinearGradient(colors: glowColors, startPoint: .leading, endPoint: .trailing)
                .frame(width: 520, height: 120)
                .clipShape(Ellipse())
                .position(x: 280, y: 250)
                .blur(radius: 50)
                .opacity(0.55)

            VStack(spacing: 0) {
                Text("Drag MiniKeys to Applications")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.top, 34)
                Spacer()
                // Kept above the bottom edge: Finder's path bar, if shown, covers the last ~28 pt.
                Text("First launch: System Settings › Privacy & Security › Open Anyway")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.bottom, 48)
            }

            // Arrow between the app (x 140) and Applications (x 420), at the icons' height.
            Path { path in
                path.move(to: CGPoint(x: 232, y: 170))
                path.addLine(to: CGPoint(x: 322, y: 170))
                path.move(to: CGPoint(x: 302, y: 152))
                path.addLine(to: CGPoint(x: 324, y: 170))
                path.addLine(to: CGPoint(x: 302, y: 188))
            }
            .stroke(.white.opacity(0.85), style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
        }
        .frame(width: 560, height: 360)
    }
}

@MainActor func render(scale: CGFloat, name: String) {
    let renderer = ImageRenderer(content: Background())
    renderer.scale = scale
    let rep = NSBitmapImageRep(cgImage: renderer.cgImage!)
    rep.size = NSSize(width: 560, height: 360)  // points, so @2x keeps its density
    try! rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name))
    print("wrote", name)
}

MainActor.assumeIsolated {
    render(scale: 1, name: "background.png")
    render(scale: 2, name: "background@2x.png")
}
