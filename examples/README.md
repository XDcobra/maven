# Example: Complete Artifact Structure

This directory shows an example of a complete artifact structure for reference.

## Directory: com/example/library/1.0.0/

Required files:
- `library-1.0.0.aar` - The actual Android archive file
- `library-1.0.0.pom` - The Maven POM descriptor
- `library-1.0.0.aar.md5` - MD5 checksum of the AAR file
- `library-1.0.0.aar.sha1` - SHA1 checksum of the AAR file
- `library-1.0.0.pom.md5` - MD5 checksum of the POM file
- `library-1.0.0.pom.sha1` - SHA1 checksum of the POM file

## Directory: com/example/library/

Required files:
- `maven-metadata.xml` - Metadata listing all available versions
- `maven-metadata.xml.md5` - MD5 checksum of metadata
- `maven-metadata.xml.sha1` - SHA1 checksum of metadata

## File Contents Examples

### library-1.0.0.pom
```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  
  <groupId>com.example</groupId>
  <artifactId>library</artifactId>
  <version>1.0.0</version>
  <packaging>aar</packaging>
  
  <name>Example Library</name>
  <description>Example library for demonstration</description>
</project>
```

### maven-metadata.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <groupId>com.example</groupId>
  <artifactId>library</artifactId>
  <versioning>
    <latest>1.0.0</latest>
    <release>1.0.0</release>
    <versions>
      <version>1.0.0</version>
    </versions>
    <lastUpdated>20260215090000</lastUpdated>
  </versioning>
</metadata>
```

### Checksum files
Each checksum file contains just the checksum hash on a single line:
```
# library-1.0.0.aar.md5
a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6

# library-1.0.0.aar.sha1
1234567890abcdef1234567890abcdef12345678
```

## For react-native-sherpa-onnx

Your structure should be:
```
com/k2fsa/sherpa/onnx/sherpa-onnx/
├── maven-metadata.xml
├── maven-metadata.xml.md5
├── maven-metadata.xml.sha1
└── 1.0.0/
    ├── sherpa-onnx-1.0.0.aar
    ├── sherpa-onnx-1.0.0.pom
    ├── sherpa-onnx-1.0.0.aar.md5
    ├── sherpa-onnx-1.0.0.aar.sha1
    ├── sherpa-onnx-1.0.0.pom.md5
    └── sherpa-onnx-1.0.0.pom.sha1
```
