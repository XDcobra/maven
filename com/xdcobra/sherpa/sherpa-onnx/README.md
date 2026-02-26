sherpa-onnx for Android (xdcobra)

This directory contains the artifact layout for the `sherpa-onnx` AAR published by XDcobra. It includes sherpa-onnx native libs (all ABIs: arm64-v8a, armeabi-v7a, x86, x86_64), C-API headers, and Kotlin/Java API (classes.jar). The POM declares a dependency on `com.xdcobra.sherpa:onnxruntime`.

- Coordinates:
- GroupId: com.xdcobra.sherpa
- ArtifactId: sherpa-onnx

**Usage (Gradle)**

- **Kotlin API** (default; recommended for Kotlin and React Native):
  ```gradle
  implementation 'com.xdcobra.sherpa:sherpa-onnx:VERSION'
  ```
- **Java API** (Builder pattern; use classifier `java`):
  ```gradle
  implementation 'com.xdcobra.sherpa:sherpa-onnx:VERSION:java@aar'
  ```

Ensure the Maven repo is added: `maven { url "https://xdcobra.github.io/maven" }`. Add `com.xdcobra.sherpa:onnxruntime` if not already present (sherpa-onnx POM declares it as dependency).

Built and published from: https://github.com/XDcobra/react-native-sherpa-onnx
