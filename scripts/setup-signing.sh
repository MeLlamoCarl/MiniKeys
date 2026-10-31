#!/bin/zsh
# Creates a self-signed code signing identity for MiniKeys, once per Mac.
#
# Ad hoc signatures change on every build, so macOS forgets the app's privacy permissions after each
# update. Signing every build with the same certificate keeps its identity stable. The certificate
# doesn't need to be trusted and lives in its own keychain (not the login keychain), so no system
# setting changes. It doesn't replace notarization: Gatekeeper still asks for Open Anyway once.
set -euo pipefail

DIR="${MINIKEYS_SIGNING_DIR:-$HOME/Library/Application Support/MiniKeys Signing}"
NAME="MiniKeys Self-Signed"
KEYCHAIN="$DIR/signing.keychain-db"

if [[ -f "$KEYCHAIN" ]]; then
  echo "Signing identity already set up in $DIR"
  exit 0
fi

mkdir -p "$DIR"
chmod 700 "$DIR"
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

# The keychain password only protects this dev-only key; it is kept next to it so builds can unlock it.
PASSWORD=$(openssl rand -hex 24)
print -r -- "$PASSWORD" > "$DIR/password"
chmod 600 "$DIR/password"

cat > "$WORK/cert.cnf" <<CNF
[req]
distinguished_name = dn
x509_extensions = ext
prompt = no
[dn]
CN = $NAME
[ext]
basicConstraints = critical,CA:false
keyUsage = critical,digitalSignature
extendedKeyUsage = critical,codeSigning
CNF
openssl req -x509 -newkey rsa:2048 -nodes -days 7300 -config "$WORK/cert.cnf" \
  -keyout "$WORK/key.pem" -out "$WORK/cert.pem" 2>/dev/null
# -legacy: macOS's importer can't read OpenSSL 3+'s default PKCS#12 encryption.
openssl pkcs12 -export -legacy -inkey "$WORK/key.pem" -in "$WORK/cert.pem" -name "$NAME" \
  -out "$DIR/MiniKeys-signing.p12" -passout "pass:$PASSWORD"
chmod 600 "$DIR/MiniKeys-signing.p12"

security create-keychain -p "$PASSWORD" "$KEYCHAIN"
security set-keychain-settings "$KEYCHAIN"   # no auto-lock timeout
security unlock-keychain -p "$PASSWORD" "$KEYCHAIN"
security import "$DIR/MiniKeys-signing.p12" -k "$KEYCHAIN" -P "$PASSWORD" -T /usr/bin/codesign >/dev/null
# Lets codesign use the key without a confirmation dialog.
security set-key-partition-list -S apple-tool:,apple: -s -k "$PASSWORD" "$KEYCHAIN" >/dev/null

echo "Created \"$NAME\" in $DIR"
echo "Back up that folder: losing it means macOS asks for permissions again after the next build."
