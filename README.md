# Maven Repository

This is XDcobra's custom Maven repository for hosting Android AAR artifacts (published via GitHub Pages).

[🌐 Repository URL: https://xdcobra.github.io/maven/](https://xdcobra.github.io/maven/)

## Available artifacts

| name | current version | artifact | description |
|---|---|---|---|
| sherpa-onnx | 1.12.24 | `com.xdcobra.sherpa:sherpa-onnx` | Native Sherpa ONNX libs with Kotlin/Java API support. |
| ffmpeg | 8.0.1 | `com.xdcobra.sherpa:ffmpeg@aar` | FFmpeg build for Android (audio-oriented). |
| libarchive | 3.8.5 | `com.xdcobra.sherpa:libarchive@aar` | Prebuilt libarchive native libs and headers. |
| onnxruntime | 1.24.2-qnn2.43.1.260218 | `com.xdcobra.sherpa:onnxruntime@aar` | ONNX Runtime artifacts used by Sherpa packages. |
| openssl | 3.6.1-1 | `com.xdcobra.openssl:openssl@aar` | OpenSSL native libraries for Android ABIs. |
| libcurl-core | 8.19.0-1 | `com.xdcobra.libcurl:libcurl-core@aar` | libcurl variant without SSL backend. |
| libcurl-openssl | 8.19.0-1 | `com.xdcobra.libcurl:libcurl-openssl@aar` | Recommended libcurl variant with OpenSSL backend. |

## Usage in Android projects

### Gradle (Groovy)

```gradle
repositories {
    mavenCentral()
    google()
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    // sherpa-onnx
    implementation 'com.xdcobra.sherpa:sherpa-onnx:1.12.24'

    // ffmpeg
    implementation 'com.xdcobra.sherpa:ffmpeg:8.0.1@aar'

    // libarchive
    implementation 'com.xdcobra.sherpa:libarchive:3.8.5@aar'

    // onnxruntime (optional explicit dependency)
    // implementation 'com.xdcobra.sherpa:onnxruntime:1.24.2-qnn2.43.1.260218@aar'

    // openssl
    implementation 'com.xdcobra.openssl:openssl:3.6.1-1@aar'

    // libcurl (recommended)
    implementation 'com.xdcobra.libcurl:libcurl-openssl:8.19.0-1@aar'

    // libcurl core (optional)
    // implementation 'com.xdcobra.libcurl:libcurl-core:8.19.0-1@aar'
}
```

### Gradle (Kotlin DSL)

```kotlin
repositories {
    mavenCentral()
    google()
    maven {
        url = uri("https://xdcobra.github.io/maven/")
    }
}

dependencies {
    implementation("com.xdcobra.sherpa:sherpa-onnx:1.12.24")
    implementation("com.xdcobra.sherpa:ffmpeg:8.0.1@aar")
    implementation("com.xdcobra.sherpa:libarchive:3.8.5@aar")
    implementation("com.xdcobra.openssl:openssl:3.6.1-1@aar")
    implementation("com.xdcobra.libcurl:libcurl-openssl:8.19.0-1@aar")
}
```

Replace version numbers with those published in each artifact's `maven-metadata.xml`.