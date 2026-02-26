# Maven Repository

This repository serves as a custom Maven repository for Android AARs under the **com.xdcobra.sherpa** group. It is used by [react-native-sherpa-onnx](https://github.com/XDcobra/react-native-sherpa-onnx) and related projects.

## Repository URL

```
https://xdcobra.github.io/maven/
```

## Available Artifacts (com.xdcobra.sherpa)

| Artifact          | Description |
|-------------------|-------------|
| **sherpa-onnx**   | sherpa-onnx native libs (all ABIs), C-API headers, Kotlin/Java API. Depends on `com.xdcobra.sherpa:onnxruntime`. |
| **ffmpeg**        | FFmpeg + libshine (audio-only), native libs and headers for all ABIs. |
| **libarchive**    | libarchive native libs and public headers for all ABIs. |
| **onnxruntime**   | ONNX Runtime with QNN, NNAPI, XNNPACK (all ABIs). |
| **sherpa-onnx-react-native** | Standalone AAR of the React Native library (optional). |

## Usage (Gradle)

Add the repository and the artifacts you need:

```gradle
repositories {
    mavenCentral()
    google()
    maven { url 'https://xdcobra.github.io/maven' }
}

dependencies {
    // sherpa-onnx (Kotlin API, default)
    implementation 'com.xdcobra.sherpa:sherpa-onnx:1.12.24'

    // sherpa-onnx Java API (classifier)
    // implementation 'com.xdcobra.sherpa:sherpa-onnx:1.12.24:java@aar'

    // FFmpeg (for react-native-sherpa-onnx Android)
    implementation 'com.xdcobra.sherpa:ffmpeg:8.0.1@aar'

    // libarchive (for react-native-sherpa-onnx Android)
    implementation 'com.xdcobra.sherpa:libarchive:3.8.5@aar'

    // ONNX Runtime (sherpa-onnx POM may pull this in; or add explicitly)
    // implementation 'com.xdcobra.sherpa:onnxruntime:1.24.2-qnn2.43.1.260218@aar'
}
```

Replace version numbers with the ones listed in the repository (see `maven-metadata.xml` in each artifact directory).

## Repository Structure

```
maven/
├── index.md
└── com/
    └── xdcobra/
        └── sherpa/
            ├── sherpa-onnx/
            │   ├── maven-metadata.xml
            │   └── [version]/
            │       ├── sherpa-onnx-[version].aar
            │       ├── sherpa-onnx-[version].pom
            │       └── (optional) sherpa-onnx-[version]-java.aar
            ├── ffmpeg/
            │   ├── maven-metadata.xml
            │   └── [version]/
            ├── libarchive/
            │   ├── maven-metadata.xml
            │   └── [version]/
            ├── onnxruntime/
            │   ├── maven-metadata.xml
            │   └── [version]/
            └── sherpa-onnx-react-native/
                ├── maven-metadata.xml
                └── [version]/
```

## Publishing

Artifacts are built and published from [react-native-sherpa-onnx](https://github.com/XDcobra/react-native-sherpa-onnx) (see `third_party/*/publish-maven/` and GitHub Actions workflows).