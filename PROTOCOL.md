# Protocolo del teclado CH57x (USB 1189:8890)

Obtenido de la herramienta de Windows del fabricante y verificado en un teclado de 3 teclas + perilla.

## Transporte

- La **interfaz USB 1** (clase HID, sin colección utilizable) tiene un único endpoint
  *interrupt OUT* `0x02` (64 bytes). macOS no le asigna driver, así que se abre con `IOUSBHost`
  sin permisos.
- Cada comando es una transferencia de **65 bytes**: `0x03` (report ID) + comando, relleno con ceros.
- Con `IOUSBHostPipe` el buffer debe venir de `IOUSBHostInterface.ioData(withCapacity:)` y el
  `completionTimeout` debe ser 0 (pipe interrupt).
- El teclado no permite leer su configuración: la app guarda su propia copia.

## Comandos

`L` = capa (1–3), `K` = número de control:

| Control | K |
|---|---|
| Teclas 1–3 | 1, 2, 3 (hasta 12 en modelos más grandes) |
| Perilla izquierda / presionar / derecha | 13, 14, 15 (perillas 2 y 3: 16–18, 19–21) |

| Comando | Bytes |
|---|---|
| Seleccionar capa | `A1 L` |
| Guardar teclas | `AA AA` |
| Guardar luz | `AA A1` |

**Teclado** (tipo 1), `n` = número de teclas (máx. 5), `mᵢ`/`kᵢ` = modificadores / uso HID:

```
A1 L
K (L<<4|1) n 0 m1 0
K (L<<4|1) n 1 m1 k1
K (L<<4|1) n 2 m2 k2      … hasta n
AA AA
```

Modificadores: `01` Ctrl, `02` Shift, `04` Alt/Opción, `08` Win/Comando (`10`–`80` los derechos).

**Multimedia** (tipo 2): `A1 L`, `K (L<<4|2) lo hi`, `AA AA` — uso Consumer de 16 bits
(`CD` play/pausa, `B5` siguiente, `B6` anterior, `E9` vol+, `EA` vol−, `E2` silencio).

**Ratón** (tipo 3): `A1 L`, `K (L<<4|3) botones x y rueda modificadores`, `AA AA`
(botones `01` izq., `02` der., `04` centro; rueda `01` arriba, `FF` abajo).

**Luz** (tipo 8): `A1 L`, `B0 (L<<4|8) modo`, `AA A1` — modo `0` apagada, `1` al presionar,
`2` ola de colores.

- Comportamiento filmado: en `1` se enciende la tecla pulsada, con un color nuevo en cada pulsación
  (girar la perilla enciende la tecla 3). En `2` una luz recorre las teclas 1 → 2 → 3 (~0,3 s cada
  una), queda oscuro ~0,9 s y repite con el siguiente color (rojo → azul → verde).
- `B0 18 modo` **solo**, sin `A1` ni `AA A1`, cambia la luz al instante sin guardarla (no gasta la
  flash; al reconectar vuelve el modo guardado). Latencia ~0,1–0,4 s. Reenviar el mismo modo no
  reinicia la animación.
- Probados sin efecto: modos 3–6, color en la mitad alta del byte (`0x12`, `0x42`, como el 8840),
  byte de color extra y el formato `FE B0 …` / `FD FE FF` del 8840: este firmware no tiene colores
  ni más efectos.
