<p align="center"><img src="Design/MiniKeys%20Icon%20256.png" width="128" alt="MiniKeys"></p>

# MiniKeys

A native macOS app to set up the 3-key + knob USB mini keypads (CH57x chip, USB `1189:8890`, sold
as "MINI KeyBoard"). It replaces the vendor's Windows tool.

- **On-screen keypad**: shows the 3 keys and the knob with what each one does, the RGB light as
  the keypad shows it, and live presses (the knob turns on screen).
- **Assign actions**: keyboard shortcuts (record them directly, or pick keys like F13–F24),
  sequences of up to 5 keys, media keys (play, volume, brightness…) and mouse (clicks and scroll).
- **Saved instantly** to the keypad's memory: it works on any computer, without the app.
- **3 layers**, switchable from the toolbar, the Keypad menu (⌘1–⌘3) or the menu bar.
- **Light**: off, on press (the pressed key lights up, in a new color each time) or color wave (a
  light runs over the keys in red, blue and green), with a faithful on-screen preview. Option to
  turn it off while the Mac is locked.
- **Presets**: Games, Media, Copy & Paste, Browse.

No drivers or special permissions: the app talks to the keypad's programming interface directly
over USB.

## Install

1. Download `MiniKeys-<version>.dmg` from Releases and drag MiniKeys to Applications.
2. The app isn't notarized: the first time, open it, go to **System Settings › Privacy &
   Security** and click **Open Anyway**.

Requires macOS 13 or later, Apple silicon or Intel.

## Build

```bash
scripts/setup-signing.sh  # once per Mac: self-signed identity, keeps permissions across builds
scripts/run-dev.sh        # Debug build, installed in /Applications and launched
scripts/build-release.sh  # universal (arm64 + x86_64), signed → dist/MiniKeys-<version>.dmg
```

Without `setup-signing.sh`, builds are signed ad hoc and macOS forgets the app's privacy
permissions after every build.

## Protocol

See [PROTOCOL.md](PROTOCOL.md).

---

Built with the help of AI tools.
