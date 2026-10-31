// Writes the layers of the Icon Composer app icon.
// Usage: swift Design/make-icon-layers.swift MiniKeys/MiniKeys.icon/Assets
//
// Liquid Glass rules: flat, opaque shapes only (no painted shadows, highlights or bevels; the system
// adds them). Foreground shapes are SVG; the soft background is a full-bleed 1024 px PNG.
import AppKit
import SwiftUI

let out = URL(fileURLWithPath: CommandLine.arguments[1], isDirectory: true)
try? FileManager.default.createDirectory(at: out, withIntermediateDirectories: true)
let canvas: CGFloat = 1024

// MARK: - Geometry (1024 canvas, y down)

let plate = CGRect(x: 136, y: 318, width: 752, height: 388)
let plateRadius = 120.0
let keySize = 140.0
let keyRadius = 34.0
let keyGap = 22.0
let keysX = plate.minX + 50
let keysY = plate.midY - keySize / 2
let knobCenter = CGPoint(x: plate.maxX - 46 - 76, y: plate.midY)
let knobRadius = 76.0

func keyRect(_ index: Int) -> CGRect {
    CGRect(x: keysX + Double(index) * (keySize + keyGap), y: keysY, width: keySize, height: keySize)
}

// MARK: - Background (PNG)

@MainActor func save<V: View>(_ view: V, _ name: String) {
    let renderer = ImageRenderer(content: view.frame(width: canvas, height: canvas))
    renderer.scale = 1
    renderer.isOpaque = false
    guard let image = renderer.cgImage else { print("render failed", name); return }
    let rep = NSBitmapImageRep(cgImage: image)
    try! rep.representation(using: .png, properties: [:])!.write(to: out.appendingPathComponent(name))
    print("wrote", name)
}

// RGB underglow: a soft rainbow pool under the keypad, like the light under the real acrylic base.
let glowColors: [Color] = [
    Color(red: 1.00, green: 0.22, blue: 0.45), Color(red: 1.00, green: 0.55, blue: 0.10),
    Color(red: 0.95, green: 0.85, blue: 0.15), Color(red: 0.20, green: 0.85, blue: 0.40),
    Color(red: 0.10, green: 0.75, blue: 0.95), Color(red: 0.25, green: 0.40, blue: 1.00),
    Color(red: 0.70, green: 0.30, blue: 1.00)
]

MainActor.assumeIsolated {
    save(
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.10, green: 0.10, blue: 0.16), Color(red: 0.03, green: 0.03, blue: 0.07)],
                startPoint: .top, endPoint: .bottom
            )
            LinearGradient(colors: glowColors, startPoint: .leading, endPoint: .trailing)
                .frame(width: 900, height: 300)
                .clipShape(Ellipse())
                .position(x: 512, y: 640)
                .blur(radius: 90)
                .opacity(0.95)
        },
        "1 Background.png"
    )
}

// MARK: - Shapes (SVG)

func writeSVG(_ body: String, _ name: String) {
    let svg = """
    <svg xmlns="http://www.w3.org/2000/svg" width="1024" height="1024" viewBox="0 0 1024 1024">\(body)</svg>

    """
    try! svg.write(to: out.appendingPathComponent(name), atomically: true, encoding: .utf8)
    print("wrote", name)
}

func roundedRect(_ rect: CGRect, _ radius: Double) -> String {
    String(format: "<rect x=\"%.1f\" y=\"%.1f\" width=\"%.1f\" height=\"%.1f\" rx=\"%.1f\"/>",
           rect.minX, rect.minY, rect.width, rect.height, radius)
}

writeSVG("<g fill=\"#FFFFFF\">\(roundedRect(plate, plateRadius))</g>", "2 Plate.svg")
for index in 0..<3 {
    writeSVG("<g fill=\"#FFFFFF\">\(roundedRect(keyRect(index), keyRadius))</g>", "3 Key \(index + 1).svg")
}
writeSVG(
    String(format: "<circle cx=\"%.1f\" cy=\"%.1f\" r=\"%.1f\" fill=\"#FFFFFF\"/>", knobCenter.x, knobCenter.y, knobRadius),
    "4 Knob.svg"
)
writeSVG(
    "<g fill=\"#FFFFFF\">\(roundedRect(CGRect(x: knobCenter.x - 9, y: knobCenter.y - knobRadius + 18, width: 18, height: 50), 9))</g>",
    "5 Knob Marker.svg"
)
