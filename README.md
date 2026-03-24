# Maven Repository

This is XDcobra's custom Maven repository for hosting Android AAR artifacts (published via GitHub Pages).

[🌐 Repository URL: https://xdcobra.github.io/maven/](https://xdcobra.github.io/maven/)

## Available artifacts

### react-native-sherpa-onnx (xdcobra distribution)

This repository hosts the XDcobra distribution of the Sherpa ONNX React Native SDK. Use the coordinates below to depend on it from your Android or React Native project.

```gradle
repositories {
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    implementation 'com.xdcobra.sherpa:sherpa-onnx-react-native:0.3.0'
}
```

### OpenSSL (Mobile Native Prebuilt)

This repository hosts precompiled native `openssl` libraries for Android ABIs (`armeabi-v7a`, `arm64-v8a`, `x86`, `x86_64`) built from [openssl-ios-android-prebuilt-and-buildscripts](https://github.com/XDcobra/openssl-ios-android-prebuilt-and-buildscripts).

```gradle
repositories {
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    implementation 'com.xdcobra.openssl:openssl:3.6.1-1@aar'
}
```

## Usage in Android projects

### Gradle (Kotlin DSL)

```kotlin
repositories {
    maven {
        url = uri("https://xdcobra.github.io/maven/")
    }
}

dependencies {
    implementation("com.xdcobra.sherpa:sherpa-onnx-react-native:0.3.0")
}
```

### Gradle (Groovy)

```gradle
repositories {
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    implementation 'com.xdcobra.sherpa:sherpa-onnx-react-native:0.3.0'
}
```