#!/bin/sh
# Standard Gradle Wrapper launcher script.
# Generate and commit gradle/wrapper/gradle-wrapper.jar using:
#   gradle wrapper --gradle-version 8.13 --distribution-type bin
# This script intentionally fails clearly until that official JAR is present.
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Gradle wrapper JAR is missing." >&2
  echo "Install Gradle 8.13 once, then run: gradle wrapper --gradle-version 8.13 --distribution-type bin" >&2
  exit 1
fi
exec java ${JAVA_OPTS:-} ${GRADLE_OPTS:-} -classpath "$WRAPPER_JAR" org.gradle.wrapper.GradleWrapperMain "$@"
