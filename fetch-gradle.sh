#!/usr/bin/env bash 

set -eu

# Folders
PROJECT_DIR=$(pwd)
WORKING_DIR="$PROJECT_DIR/sdk"
GRADLE_DIR="$WORKING_DIR/gradle"


# Versions
GRADLE_VERSION="8.11.1"

# Make sure WORKING_DIR directory exists
mkdir -p "$WORKING_DIR" && cd "$WORKING_DIR"


# Fetch the zip  archive
FILENAME="gradle-${GRADLE_VERSION}-all.zip"
FETCH_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip"
echo "Gradle location: $FETCH_URL"


# echo "Begin Download of Flutter SDK archive: ${FILENAME}"
wget --continue --tries=10 "$FETCH_URL" 


echo "Begin Extract Gradle"
# Make sure GRADLE_DIR does NOT exists
if [ -d "$GRADLE_DIR" ]; then rm -Rf "$GRADLE_DIR"; fi
# Extract Archive
unzip "${FILENAME}" -d "${GRADLE_DIR}"

echo
echo "Gradle Download and Extraction Complete"
echo "Gradle location: ${GRADLE_DIR}"
echo
