#!/usr/bin/env bash 

set -eu

# Folders
PROJECT_DIR=$(pwd)
WORKING_DIR="$PROJECT_DIR/sdk"
ANDROID_DIR="$WORKING_DIR/android"

JAVA_HOME="$WORKING_DIR/java"
export JAVA_HOME


declare -a ANDROID_PACKAGES=(
    "build-tools;33.0.2"
    "build-tools;34.0.0"
    "build-tools;35.0.0"
    "cmake;3.31.1"
    "emulator"
    "extras;android;m2repository"
    "extras;google;m2repository"
    "ndk-bundle"
    "platform-tools"
    "platforms;android-33"
    "platforms;android-34"
    "platforms;android-35"
    "sources;android-33"
    "sources;android-34"
    "sources;android-35"
    "system-images;android-35;google_apis_playstore;x86_64"
    "system-images;android-35;google_apis;x86_64"
    "tools"
)



# Make sure WORKING_DIR directory exists
mkdir -p "$WORKING_DIR" && cd "$WORKING_DIR"


# These Command Line Tools are used to boot strap only!!!
mkdir -p "${ANDROID_DIR}" && cd "${ANDROID_DIR}"
wget --tries=0 --continue "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip" -O cmdline-tools-temp.zip
unzip -vu cmdline-tools-temp.zip -d "${ANDROID_DIR}"/cmdline-tools-temp
echo "Bootstrap cmdline-tools Download and Extraction Complete"

BOOTSTRAP_SDK_MANAGER="${ANDROID_DIR}"/cmdline-tools-temp/cmdline-tools/bin/sdkmanager

echo
echo "Bootstrap cmdline-tools version:"
"$BOOTSTRAP_SDK_MANAGER" --sdk_root="${ANDROID_DIR}"  --version
echo

echo "Install most current cmdline-tools"
yes | "$BOOTSTRAP_SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --licenses && "$BOOTSTRAP_SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --install "cmdline-tools;latest"
echo

echo
echo "Latest cmdline-tools version:"
SDK_MANAGER="${ANDROID_DIR}/cmdline-tools/latest/bin/sdkmanager"
echo "$SDK_MANAGER"
"$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --version
echo



for i in "${ANDROID_PACKAGES[@]}"
do
   echo "$i"
   # Channels: 0 (stable), 1 (beta), 2 (dev), or 3 (canary)
   yes | "$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --channel=3 --licenses && "$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --channel=3 --install "$i" | grep --invert-match "^Warning:*"
done

yes | "$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --channel=3 --licenses && "$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --channel=3 --update
"$SDK_MANAGER" --sdk_root="${ANDROID_DIR}" --channel=3 --list_installed


echo
echo "Android Download and Extraction Complete"
echo "Android location: ${ANDROID_DIR}"
echo
