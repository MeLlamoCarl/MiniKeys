#!/bin/zsh
# Signs an app with the self-signed MiniKeys identity (see setup-signing.sh), or ad hoc if it
# hasn't been set up on this Mac.
# Usage: scripts/sign.sh path/to/MiniKeys.app
set -euo pipefail

APP="${1:?path to MiniKeys.app}"
DIR="${MINIKEYS_SIGNING_DIR:-$HOME/Library/Application Support/MiniKeys Signing}"
KEYCHAIN="$DIR/signing.keychain-db"

if [[ -f "$KEYCHAIN" && -f "$DIR/password" ]]; then
  security unlock-keychain -p "$(<"$DIR/password")" "$KEYCHAIN"
  codesign --force --deep --timestamp=none --keychain "$KEYCHAIN" --sign "MiniKeys Self-Signed" "$APP"
  echo "Signed with MiniKeys Self-Signed"
else
  codesign --force --deep --timestamp=none --sign - "$APP"
  echo "Signed ad hoc (run scripts/setup-signing.sh to keep permissions across builds)"
fi
codesign --verify --deep --strict "$APP"
