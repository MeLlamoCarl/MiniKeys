# MiniKeys firmware

Replacement firmware for the CH552G 3-key + knob keypad (USB `1189:8890`). It speaks the same
programming protocol as the stock firmware (see [../PROTOCOL.md](../PROTOCOL.md)), so MiniKeys keeps
working, and adds full control of the three WS2812 RGB LEDs.

## What it adds

| Command | Bytes | Effect |
|---|---|---|
| Light effect | `B1 effect r g b speed brightness flags` | effect: 0 off, 1 on press, 2 wave, 3 solid, 4 breathe, 5 rainbow, 6 layer color; speed 1–10; flags: `01` multicolor, `02` blink the layer number on layer changes. Save with `AA A1`. |
| Live key color | `B2 key r g b` (`key` 1–3, 0 = all; `B2 FF` clears) | Overrides the effect until cleared; not saved. |
| Layer color | `B3 L r g b` | Used by the layer effect and the layer blink. Save with `AA A1`. |
| Bootloader | `BB 4D 4B` | Reboots into the WCH bootloader for updates. |

`A1 L` also makes layer `L` active right away (the stock firmware only switches when a key of
that layer is written). Bindings, light settings and layer colors live in the 128-byte data flash;
bindings take 1 byte plus their payload each, so very long sequences on every key may not fit
(the keypad blinks red and keeps the last saved state).

The firmware reports `bcdDevice` `0x20xx` and the product name "MiniKeys Keypad", which is how
MiniKeys tells it apart from the stock firmware.

## Build and flash

Requires SDCC (`brew install sdcc`) and [wchisp](https://github.com/ch32-rs/wchisp)
(`cargo install wchisp`).

```bash
make bin      # build minikeys.bin
make flash    # upload; the keypad must be in bootloader mode
```

Bootloader mode:
- **First time** (stock firmware): open the keypad and connect pin 3 (P1.5) of the CH552G to
  GND (pin 9) while plugging in USB.
- **Afterwards**: hold key 1 while plugging in (the LEDs turn white), or send `BB 4D 4B`.

The stock firmware can't be read back, so it can't be restored; its data flash (key bindings) can
be saved with `wchisp eeprom dump`.

## Pins

| Function | Pin |
|---|---|
| Keys 1, 2, 3 | P1.1, P1.7, P1.6 |
| Knob A, B, switch | P3.0, P3.1, P3.3 |
| WS2812 data (3 pixels) | P3.4 |

## Credits and license

Pin mapping from biemster's [RGB Macropad Custom Firmware](https://hackaday.io/project/189914).
The CH55x libraries in `src/` (USB stack, NeoPixel, data flash, GPIO, delays) come from Stefan
Wagner's [CH552 projects](https://github.com/wagiminator) and, with the files derived from them, are
licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/). `ch554.h` is WCH's
register header.
