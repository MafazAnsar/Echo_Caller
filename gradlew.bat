@echo off
set DIR=%~dp0
if not exist "%DIR%gradle\wrapper\gradle-wrapper.jar" (
  echo Gradle wrapper JAR is missing.
  echo Install Gradle 8.13 once, then run: gradle wrapper --gradle-version 8.13 --distribution-type bin
  exit /b 1
)
java %JAVA_OPTS% %GRADLE_OPTS% -classpath "%DIR%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
