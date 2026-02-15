# Sherpa ONNX AAR Files

This directory contains the Android .aar files for the sherpa-onnx library.

## How to Add a New Version

1. Create a new version directory (e.g., `1.0.0/`)
2. Add the following files:
   - `sherpa-onnx-[version].aar` - The Android archive file
   - `sherpa-onnx-[version].pom` - The Maven POM file
   - `sherpa-onnx-[version].aar.md5` - MD5 checksum
   - `sherpa-onnx-[version].aar.sha1` - SHA1 checksum
   - `sherpa-onnx-[version].pom.md5` - MD5 checksum for POM
   - `sherpa-onnx-[version].pom.sha1` - SHA1 checksum for POM
3. Update `maven-metadata.xml` with the new version
4. Commit and push

## Example POM File

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  
  <groupId>com.k2fsa.sherpa.onnx</groupId>
  <artifactId>sherpa-onnx</artifactId>
  <version>1.0.0</version>
  <packaging>aar</packaging>
  
  <name>Sherpa ONNX</name>
  <description>Sherpa ONNX library for Android</description>
</project>
```

## Generating Checksums

```bash
# Generate MD5
md5sum sherpa-onnx-[version].aar > sherpa-onnx-[version].aar.md5

# Generate SHA1
sha1sum sherpa-onnx-[version].aar > sherpa-onnx-[version].aar.sha1
```
