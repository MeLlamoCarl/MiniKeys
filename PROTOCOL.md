# CH57x keypad protocol (USB 1189:8890)

Taken from the vendor's Windows tool and verified on a 3-key + knob keypad.

## Transport

- **USB interface 1** (HID class, no usable collection) has a single *interrupt OUT* endpoint
  `0x02` (64 bytes). macOS attaches no driver to it, so it can be opened with `IOUSBHost` without
  any permission.
- Each command is a **65-byte** transfer: `0x03` (report ID) + command, zero padded.
- With `IOUSBHostPipe` the buffer must come from `IOUSBHostInterface.ioData(withCapacity:)` and
  `completionTimeout` must be 0 (interrupt pipe).
- The keypad's configuration can't be read back: the app keeps its own copy.

## Commands

`L` = layer (1–3), `K` = control number:

| Control | K |
|---|---|
| Keys 1–3 | 1, 2, 3 (up to 12 on bigger models) |
| Knob left / press / right | 13, 14, 15 (knobs 2 and 3: 16–18, 19–21) |

| Command | Bytes |
|---|---|
| Select layer | `A1 L` (doesn't activate the layer by itself; see below) |
| Save keys | `AA AA` |
| Save light | `AA A1` |

**Keyboard** (type 1), `n` = number of keys (max. 5), `mᵢ`/`kᵢ` = modifiers / HID usage:

```
A1 L
K (L<<4|1) n 0 m1 0
K (L<<4|1) n 1 m1 k1
K (L<<4|1) n 2 m2 k2      … up to n
AA AA
```

Modifiers: `01` Ctrl, `02` Shift, `04` Alt/Option, `08` Win/Command (`10`–`80` the right-hand ones).

**Media** (type 2): `A1 L`, `K (L<<4|2) lo hi`, `AA AA` — 16-bit Consumer usage
(`CD` play/pause, `B5` next, `B6` previous, `E9` volume up, `EA` volume down, `E2` mute,
`6F`/`70` brightness up/down).

**Mouse** (type 3): `A1 L`, `K (L<<4|3) buttons x y wheel modifiers`, `AA AA`
(buttons `01` left, `02` right, `04` middle; wheel `01` up, `FF` down).

**Light** (type 8): `A1 L`, `B0 (L<<4|8) mode`, `AA A1` — mode `0` off, `1` on press,
`2` color wave.

- Filmed behavior: in `1` the pressed key lights up, in a new color on every press (turning the
  knob lights key 3). In `2` a light runs over keys 1 → 2 → 3 (~0.3 s each), stays dark ~0.9 s and
  repeats in the next color (red → blue → green).
- `B0 18 mode` **alone**, without `A1` or `AA A1`, changes the light right away without saving it
  (no flash wear; the saved mode comes back when the keypad is plugged in again). Latency
  ~0.1–0.4 s. Sending the same mode again doesn't restart the animation.
- Tried without effect: modes 3–6, a color in the high nibble (`0x12`, `0x42`, as on the 8840), an
  extra color byte, and the 8840's `FE B0 …` / `FD FE FF` format: this firmware has no colors or
  other effects.

## Layers

`A1 L` only says which layer the next commands are for. Neither `A1 L` nor `A1 L` + `AA AA`
changes the active layer: the keypad switches to layer `L` when a key of that layer is written.
To activate a layer, MiniKeys writes its keys again.
