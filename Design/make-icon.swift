// Renders the app icon: swift Design/make-icon.swift <output.png>
import AppKit

let size: CGFloat = 1024
let output = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "icon.png"
let image = NSImage(size: NSSize(width: size, height: size))
image.lockFocus()
let context = NSGraphicsContext.current!.cgContext

// macOS icon grid: 824 pt squircle centred in 1024.
let body = CGRect(x: 100, y: 100, width: 824, height: 824)
let squircle = NSBezierPath(roundedRect: body, xRadius: 185, yRadius: 185)
context.saveGState()
context.setShadow(offset: CGSize(width: 0, height: -12), blur: 28, color: NSColor.black.withAlphaComponent(0.45).cgColor)
NSColor(white: 0.08, alpha: 1).setFill()
squircle.fill()
context.restoreGState()
NSGradient(colors: [NSColor(white: 0.2, alpha: 1), NSColor(white: 0.05, alpha: 1)])!.draw(in: squircle, angle: -90)

// Rainbow underglow, fading upwards into the body.
squircle.addClip()
let rainbow = NSGradient(colors: [.systemPink, .systemOrange, .systemYellow, .systemGreen, .systemTeal, .systemBlue, .systemPurple])!
rainbow.draw(in: CGRect(x: 100, y: 100, width: 824, height: 420), angle: 0)
NSGradient(colors: [NSColor(white: 0.07, alpha: 0.55), NSColor(white: 0.13, alpha: 1)])!
    .draw(in: CGRect(x: 100, y: 100, width: 824, height: 420), angle: 90)
// Keypad plate.
let plate = NSBezierPath(roundedRect: CGRect(x: 170, y: 362, width: 684, height: 300), xRadius: 70, yRadius: 70)
NSGradient(colors: [NSColor(white: 0.26, alpha: 1), NSColor(white: 0.1, alpha: 1)])!.draw(in: plate, angle: -90)
NSColor(white: 1, alpha: 0.18).setStroke()
plate.lineWidth = 4
plate.stroke()

// Three keys.
let keyTints: [NSColor] = [.systemPink, .systemGreen, .systemBlue]
for index in 0..<3 {
    let rect = CGRect(x: 215 + CGFloat(index) * 150, y: 442, width: 130, height: 140)
    let key = NSBezierPath(roundedRect: rect, xRadius: 26, yRadius: 26)
    NSGradient(colors: [NSColor(white: 0.32, alpha: 1), NSColor(white: 0.16, alpha: 1)])!.draw(in: key, angle: -90)
    NSGradient(colors: [keyTints[index].withAlphaComponent(0.7), keyTints[index].withAlphaComponent(0)])!
        .draw(in: key, relativeCenterPosition: NSPoint(x: 0, y: -0.9))
    NSColor(white: 1, alpha: 0.15).setStroke()
    key.lineWidth = 3
    key.stroke()
}

// Knob.
let knobRect = CGRect(x: 680, y: 432, width: 160, height: 160)
let knob = NSBezierPath(ovalIn: knobRect)
NSGradient(colors: [NSColor(white: 0.92, alpha: 1), NSColor(white: 0.45, alpha: 1)])!.draw(in: knob, angle: -60)
let inner = NSBezierPath(ovalIn: knobRect.insetBy(dx: 26, dy: 26))
NSGradient(colors: [NSColor(white: 0.7, alpha: 1), NSColor(white: 0.38, alpha: 1)])!.draw(in: inner, angle: -60)
NSColor.white.setFill()
NSBezierPath(roundedRect: CGRect(x: knobRect.midX - 7, y: knobRect.midY + 22, width: 14, height: 40), xRadius: 7, yRadius: 7).fill()

image.unlockFocus()
let rep = NSBitmapImageRep(data: image.tiffRepresentation!)!
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: output))
