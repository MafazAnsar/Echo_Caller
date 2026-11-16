# Building ECHO

## Toolchain
- JDK 17
- Android SDK platform 36
- Gradle 8.13
- Android Gradle Plugin 8.13.0
- Kotlin 2.2.20

The project pins the Gradle distribution in `gradle/wrapper/gradle-wrapper.properties`.

## Complete the official Gradle wrapper
This starter contains the wrapper scripts and properties, but not the binary wrapper JAR. A binary JAR must not be replaced with a placeholder.

On a machine with Gradle 8.13 installed, run from the repository root:

```bash
gradle wrapper --gradle-version 8.13 --distribution-type bin
```

Then commit all of:
- `gradlew`
- `gradlew.bat`
- `gradle/wrapper/gradle-wrapper.jar`
- `gradle/wrapper/gradle-wrapper.properties`

After that, use `./gradlew` (macOS/Linux) or `gradlew.bat` (Windows) for reproducible local builds. The current GitHub Actions workflow temporarily uses the pinned Gradle 8.13 distribution directly until the wrapper JAR is committed. The next CI improvement should switch its commands to `./gradlew`.

## Local commands

```bash
gradle --no-daemon :app:lintDebug
gradle --no-daemon :app:testDebugUnitTest
gradle --no-daemon :app:assembleDebug
```

## GitHub Actions artifact
Open the repository's Actions tab, select the latest successful Android CI run, and download `ECHO-debug-apk` under Artifacts.
