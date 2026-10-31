#!/bin/zsh
# Universal (arm64 + x86_64) Release build, ad hoc signed, packed as dist/MiniKeys-<version>.dmg.
set -euo pipefail
cd "$(dirname "$0")/.."
VERSION=$(grep -m1 'MARKETING_VERSION' MiniKeys.xcodeproj/project.pbxproj | sed -E 's/.*= ([^;]+);/\1/')
xcodebuild -scheme MiniKeys -configuration Release -derivedDataPath build/release \
  ARCHS="arm64 x86_64" ONLY_ACTIVE_ARCH=NO \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO build 2>&1 \
  | grep -E "error:|BUILD (SUCCEEDED|FAILED)"
APP=build/release/Build/Products/Release/MiniKeys.app
codesign --force --deep --sign - --timestamp=none "$APP"
codesign --verify --deep --strict "$APP"
echo "Architectures: $(lipo -archs "$APP/Contents/MacOS/MiniKeys")"

mkdir -p dist
DMG="dist/MiniKeys-$VERSION.dmg"
scripts/make-dmg.sh "$APP" "$DMG"
(cd dist && shasum -a 256 "MiniKeys-$VERSION.dmg" > "MiniKeys-$VERSION.dmg.sha256")
echo "Created $DMG"
