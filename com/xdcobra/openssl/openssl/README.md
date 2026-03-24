OpenSSL for Android (xdcobra)

This directory contains the artifact layout for the `openssl` AAR published by XDcobra. It includes OpenSSL native libraries for all Android ABIs (arm64-v8a, armeabi-v7a, x86, x86_64), providing both shared (`.so`) and static (`.a`) libraries for integration into mobile applications.

- Coordinates:
  - **GroupId**: com.xdcobra.openssl
  - **ArtifactId**: openssl

**Usage (Gradle)**

Add the Maven repository and the dependency:

```gradle
repositories {
    maven { url "https://xdcobra.github.io/maven" }
}

dependencies {
    // Standard AAR dependency
    implementation 'com.xdcobra.openssl:openssl:VERSION'
}
```

This AAR is intended to be used by other libraries (like `libcurl`) or directly by Android applications requiring OpenSSL for SSL/TLS support or SSL Pinning.

Built and published from: https://github.com/XDcobra/openssl-ios-android-prebuilt-and-buildscripts
