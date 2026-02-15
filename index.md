# Maven Repository

This repository serves as a custom Maven repository for hosting Android .aar files.

## Available Artifacts

### react-native-sherpa-onnx

To use this artifact in your project, add the following to your `build.gradle`:

```gradle
repositories {
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    implementation 'com.k2fsa.sherpa.onnx:sherpa-onnx:VERSION'
}
```

Replace `VERSION` with the desired version number.

## Publishing to this Repository

To publish a new artifact:

1. Build your .aar file
2. Organize it in the Maven directory structure: `groupId/artifactId/version/`
3. Generate POM files and metadata
4. Commit and push to the repository

## Repository Structure

```
maven/
├── com/
│   └── k2fsa/
│       └── sherpa/
│           └── onnx/
│               └── sherpa-onnx/
│                   ├── maven-metadata.xml
│                   └── [version]/
│                       ├── sherpa-onnx-[version].aar
│                       ├── sherpa-onnx-[version].pom
│                       └── checksums...
```
