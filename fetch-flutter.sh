#!/usr/bin/env bash 

set -eu

# Folders
PROJECT_DIR=$(pwd)
WORKING_DIR="$PROJECT_DIR/sdk"
FLUTTER_DIR="$WORKING_DIR/flutter"


# Versions
FLUTTER_VERSION="3.27.1"

# Make sure WORKING_DIR directory exists
mkdir -p "$WORKING_DIR" && cd "$WORKING_DIR"


# Fetch the tar.xz archive
FILENAME="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
FETCH_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FILENAME}"
echo "Flutter SDK location: $FETCH_URL"


echo "Begin Download of Flutter SDK archive: ${FILENAME}"
wget --continue --tries=10 "$FETCH_URL" 


echo "Begin Extract Flutter SDK"
# Make sure FLUTTER_DIR does NOT exists
if [ -d "$FLUTTER_DIR" ]; then rm -Rf "$FLUTTER_DIR"; fi
# Extract Archive
tar -xvf "${FILENAME}"

echo
echo "Flutter Download and Extraction Complete"
echo "Flutter SDK location: ${FLUTTER_DIR}"
echo
