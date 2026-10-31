<p align="center"><img src="Design/MiniKeys%20Icon%20256.png" width="128" alt="MiniKeys"></p>

# MiniKeys

App nativa de macOS para configurar los mini teclados USB de 3 teclas + perilla (chip CH57x,
USB `1189:8890`, vendidos como "MINI KeyBoard"). Reemplaza la herramienta de Windows del fabricante.

- **Teclado en pantalla**: ves las 3 teclas y la perilla con lo que hace cada una, el brillo RGB
  según el modo de luz, y las pulsaciones en vivo (la perilla gira en pantalla).
- **Asignar acciones**: atajos de teclado (graba la combinación directamente, o elige teclas como
  F13–F24), secuencias de hasta 5 teclas, multimedia (play, volumen, brillo…) y ratón (clics y rueda).
- **Se guarda al instante** en la memoria del teclado: funciona en cualquier computador, sin la app.
- **3 capas**, elegibles desde la ventana o desde la barra de menú.
- **Luz**: apagada, al presionar o siempre encendida.
- **Plantillas**: Juegos, Multimedia, Copiar y pegar, Navegar.

Sin drivers ni permisos especiales: la app habla con la interfaz de programación del teclado
directamente por USB.

## Instalar

1. Descarga `MiniKeys-<versión>.dmg` desde Releases y arrastra MiniKeys a Aplicaciones.
2. La app no está notarizada: la primera vez, ábrela, ve a **Ajustes del Sistema › Privacidad y
   seguridad** y pulsa **Abrir igualmente**.

Requiere macOS 13 o posterior, Apple silicon o Intel.

## Compilar

```bash
scripts/run-dev.sh        # Debug, se instala en /Applications y se abre
scripts/build-release.sh  # universal (arm64 + x86_64), firmado ad hoc → dist/MiniKeys-<versión>.dmg
```

## Protocolo

Ver [PROTOCOL.md](PROTOCOL.md).

---

Desarrollado con ayuda de herramientas de IA.
