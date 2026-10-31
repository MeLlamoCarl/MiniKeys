#!/bin/zsh
# Builds a Debug copy, signs it (scripts/sign.sh), installs it in /Applications and (re)launches it.
set -euo pipefail
cd "$(dirname "$0")/.."
DERIVED="${DERIVED_DATA:-build/debug}"
xcodebuild -scheme MiniKeys -configuration Debug -derivedDataPath "$DERIVED" \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO build 2>&1 \
  | grep -E "error:|BUILD (SUCCEEDED|FAILED)"
APP="$DERIVED/Build/Products/Debug/MiniKeys.app"
scripts/sign.sh "$APP"
osascript -e 'quit app "MiniKeys"' 2>/dev/null || true
sleep 1
rm -rf /Applications/MiniKeys.app
ditto "$APP" /Applications/MiniKeys.app
open /Applications/MiniKeys.app
