#!/bin/zsh
# Waits for the keypad in bootloader mode, backs up the stock data flash once, then flashes.
cd "$(dirname "$0")"
for i in {1..1200}; do
  if wchisp probe 2>&1 | grep -q "Found [1-9]"; then
    echo "bootloader found $(date +%T)"
    wchisp info 2>&1 | tail -6
    [[ -f backup/stock-dataflash.bin ]] || wchisp eeprom dump backup/stock-dataflash.bin 2>&1 | tail -2
    wchisp flash minikeys.bin 2>&1 | tail -6
    exit 0
  fi
  sleep 0.5
done
echo "timed out"
exit 1
