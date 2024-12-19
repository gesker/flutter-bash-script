#!/usr/bin/env bash 

set -eu

# Folders
PROJECT_DIR=$(pwd)
WORKING_DIR="$PROJECT_DIR/sdk"
JDK_DIR="$WORKING_DIR/java"


# Versions
JDK_VERSION="17"



# Make sure WORKING_DIR directory exists
mkdir -p "$WORKING_DIR" && cd "$WORKING_DIR"




# URL for latest Java JDK for JDK_VERSION from Adoptium/Temurin project
API_URL="https://api.adoptium.net/v3/binary/latest/${JDK_VERSION}/ga/linux/x64/jdk/hotspot/normal/eclipse"
echo "Java JDK latest API call to: $API_URL"


# Fetch the tar.gz archive
FETCH_URL=$(wget --tries=0 --max-redirect=0 "${API_URL}" 2>&1 | awk '/Location: /,// { print }' | awk '{print $2}')
echo "Java JDK download location: $FETCH_URL"

FILENAME=$(basename "$FETCH_URL")
echo "Java JDK archive name: ${FILENAME}"


echo "Begin Download of Java JDK archive: ${FILENAME}"
wget --continue --tries=10 "$FETCH_URL" 
echo "Begin Download of Java JDK archive SHA256 file: ${FILENAME}.sha256.txt"
wget --continue --tries=10 "$FETCH_URL".sha256.txt 

SHA_CHECK=$(sha256sum --check "${FILENAME}.sha256.txt")

if [[ ${SHA_CHECK} == *"OK"* ]]; then
  echo "sha256 for archive is: ${SHA_CHECK}"
  cat "${FILENAME}.sha256.txt"
fi
echo "Java JDK Downloaded successfully: ${WORKING_DIR}/${FILENAME}"


echo "Begin Extract Java JDK"
# Make sure JDK_DIR does NOT exists
if [ -d "$JDK_DIR" ]; then rm -Rf "$JDK_DIR"; fi
# Make sure previously extracted do NOT exists
find . -depth -type d -name "jdk-${JDK_VERSION}*" -exec rm -rf {} \;
# Extract Archive
tar -xvf "${FILENAME}"
# Rename Archive
find . -depth -type d -name "jdk-${JDK_VERSION}*" -exec mv {} "${JDK_DIR}" \;

echo
echo "Java JDK Download and Extraction Complete"
echo "Java JDK location: ${JDK_DIR}"
echo
