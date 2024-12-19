# Flutter-Download

Simple Flutter Download Bash Scripts

Scripts included for Java JDK, Gradle Build Tool, Android SDK & Flutter

## TL;DR

```bash
git clone https://github.com/gesker/flutter-download
cd flutter-download
./fetch-java.sh
./fetch-gradle.sh
./fetch-android.sh
./fetch-flutter.sh
```

## LICENSE

MIT LICENSE; [LICENSE](./LICENSE);

## Scripts

Each script downloads a component used in building Flutter applications on Linux.

The files are downloaded to and extracted in a sub-folder called `sdk` in this repository. The `sdk` folder has already been added to the [gitignore](./.gitignore) file of this repository.

Each script has a variable/array near the top where the version or package list can be updated.

No GUI tools are required and no variables are set in the shell. However, easily found/installed command line tools (wget, tar, unzip, etc.) must be installed on your system.

NO environment variables need to be set. However, run the `[fetch-java.sh](./fetch-java.sh)` script before running the `[fetch-android.sh](./fetch-android.sh)` as it depends on the Java JDK from the first script.

- `[fetch-java.sh](./fetch-java)` downloads [Adoptium/Temurin](https://adoptium.net/temurin/releases/?version=17&arch=x64&package=jdk&os=linux) version **17** of the Java JDK for Linux
- `[fetch-gradle](./fetch-gradle)` downloads [Gradle](https://gradle.org/releases/) version **8.11.1**
- `[fetch-flutter](./fetch-flutter)` downloads [Flutter](https://flutter.dev) version **3.21.1**
- `[fetch-android](./fetch-android)` downloads the following [Android](https://developer.android.com) Platforms, Build Tools, etc.
  - "build-tools;33.0.2"
  - "build-tools;34.0.0"
  - "build-tools;35.0.0"
  - "cmake;3.31.1"
  - "emulator"
  - "extras;android;m2repository"
  - "extras;google;m2repository"
  - "ndk-bundle"
  - "platform-tools"
  - "platforms;android-33"
  - "platforms;android-34"
  - "platforms;android-35"
  - "sources;android-33"
  - "sources;android-34"
  - "sources;android-35"
  - "system-images;android-35;google_apis_playstore;x86_64"
  - "system-images;android-35;google_apis;x86_64"
  - "tools"

**Note**: The [sdkmanager](https://developer.android.com/tools/sdkmanager) command in the [fetch-android](./fetch-android) script may throw warnings. These are annoying but harmless.  

## Pull Requests

Pull Requests are welcome
