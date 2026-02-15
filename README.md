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