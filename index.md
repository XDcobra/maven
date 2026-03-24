# Maven Repository

This repository serves as a custom Maven repository for Android AARs under **com.xdcobra.*** groups (for example `com.xdcobra.sherpa`, `com.xdcobra.openssl`, and `com.xdcobra.libcurl`). It is used by [react-native-sherpa-onnx](https://github.com/XDcobra/react-native-sherpa-onnx) and related projects.

## Repository URL

```
https://xdcobra.github.io/maven/
```

## Available Artifacts

| Artifact          | Description |
|-------------------|-------------|
| **sherpa-onnx**   | sherpa-onnx native libs (all ABIs), C-API headers, Kotlin/Java API. Depends on `com.xdcobra.sherpa:onnxruntime`. |
| **ffmpeg**        | FFmpeg + libshine (audio-only) + libopus, native libs and headers for all ABIs. |
| **libarchive**    | libarchive native libs and public headers for all ABIs. |
| **libcurl**       | libcurl native libs for all ABIs. Published as `libcurl-core` and `libcurl-openssl` variants. |
| **onnxruntime**   | ONNX Runtime with QNN, NNAPI, XNNPACK (all ABIs). |
| **openssl**       | OpenSSL native libs (all ABIs), static and shared libraries, and headers. |

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
    
    // OpenSSL (Native static and shared libraries)
    implementation 'com.xdcobra.openssl:openssl:3.6.1-1@aar'

    // libcurl (without SSL backend)
    // implementation 'com.xdcobra.libcurl:libcurl-core:8.19.0-1@aar'

    // libcurl + OpenSSL backend (recommended)
    implementation 'com.xdcobra.libcurl:libcurl-openssl:8.19.0-1@aar'
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
        └── openssl/
            ├── openssl/
            │   ├── maven-metadata.xml
            │   └── [version]/
        └── libcurl/
            ├── libcurl-core/
            │   ├── maven-metadata.xml
            │   └── [version]/
            └── libcurl-openssl/
                ├── maven-metadata.xml
                └── [version]/
```

## Publishing

Artifacts are built and published from [react-native-sherpa-onnx](https://github.com/XDcobra/react-native-sherpa-onnx) (see `third_party/*/publish-maven/` and GitHub Actions workflows).