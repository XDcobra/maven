#!/bin/bash

# Script to publish a new AAR artifact to the Maven repository
# Usage: ./publish-artifact.sh <groupId> <artifactId> <version> <aar-file>
# Example: ./publish-artifact.sh com.k2fsa.sherpa.onnx sherpa-onnx 1.0.0 sherpa-onnx.aar

set -e

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <groupId> <artifactId> <version> <aar-file>"
    echo "Example: $0 com.k2fsa.sherpa.onnx sherpa-onnx 1.0.0 sherpa-onnx.aar"
    exit 1
fi

GROUP_ID="$1"
ARTIFACT_ID="$2"
VERSION="$3"
AAR_FILE="$4"

# Convert groupId to path (com.example -> com/example)
GROUP_PATH="${GROUP_ID//.//}"

# Create directory structure
ARTIFACT_PATH="${GROUP_PATH}/${ARTIFACT_ID}"
VERSION_PATH="${ARTIFACT_PATH}/${VERSION}"

echo "Creating directory structure: ${VERSION_PATH}"
mkdir -p "${VERSION_PATH}"

# Copy AAR file
AAR_NAME="${ARTIFACT_ID}-${VERSION}.aar"
POM_NAME="${ARTIFACT_ID}-${VERSION}.pom"

echo "Copying AAR file to ${VERSION_PATH}/${AAR_NAME}"
cp "${AAR_FILE}" "${VERSION_PATH}/${AAR_NAME}"

# Generate POM file
echo "Generating POM file: ${VERSION_PATH}/${POM_NAME}"
cat > "${VERSION_PATH}/${POM_NAME}" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  
  <groupId>${GROUP_ID}</groupId>
  <artifactId>${ARTIFACT_ID}</artifactId>
  <version>${VERSION}</version>
  <packaging>aar</packaging>
  
  <name>${ARTIFACT_ID}</name>
  <description>${ARTIFACT_ID} library for Android</description>
</project>
EOF

# Generate checksums
echo "Generating checksums..."
cd "${VERSION_PATH}"
md5sum "${AAR_NAME}" | cut -d' ' -f1 > "${AAR_NAME}.md5"
sha1sum "${AAR_NAME}" | cut -d' ' -f1 > "${AAR_NAME}.sha1"
md5sum "${POM_NAME}" | cut -d' ' -f1 > "${POM_NAME}.md5"
sha1sum "${POM_NAME}" | cut -d' ' -f1 > "${POM_NAME}.sha1"
cd - > /dev/null

# Update or create maven-metadata.xml
METADATA_FILE="${ARTIFACT_PATH}/maven-metadata.xml"
TIMESTAMP=$(date -u +%Y%m%d%H%M%S)

if [ -f "${METADATA_FILE}" ]; then
    echo "Updating maven-metadata.xml"
    # Read existing versions and add new one
    # This is a simplified version - you might want to use xmlstarlet for better XML manipulation
else
    echo "Creating new maven-metadata.xml"
fi

cat > "${METADATA_FILE}" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <groupId>${GROUP_ID}</groupId>
  <artifactId>${ARTIFACT_ID}</artifactId>
  <versioning>
    <latest>${VERSION}</latest>
    <release>${VERSION}</release>
    <versions>
      <version>${VERSION}</version>
    </versions>
    <lastUpdated>${TIMESTAMP}</lastUpdated>
  </versioning>
</metadata>
EOF

# Generate checksums for metadata
cd "${ARTIFACT_PATH}"
md5sum "maven-metadata.xml" | cut -d' ' -f1 > "maven-metadata.xml.md5"
sha1sum "maven-metadata.xml" | cut -d' ' -f1 > "maven-metadata.xml.sha1"
cd - > /dev/null

echo ""
echo "✅ Artifact published successfully!"
echo ""
echo "Directory: ${VERSION_PATH}"
echo "Files created:"
echo "  - ${AAR_NAME}"
echo "  - ${POM_NAME}"
echo "  - Checksums (MD5 and SHA1)"
echo ""
echo "Next steps:"
echo "1. Review the generated files"
echo "2. git add ${GROUP_PATH}"
echo "3. git commit -m 'Add ${ARTIFACT_ID} version ${VERSION}'"
echo "4. git push"
echo ""
echo "Usage in Gradle:"
echo ""
echo "repositories {"
echo "    maven {"
echo "        url 'https://xdcobra.github.io/maven/'"
echo "    }"
echo "}"
echo ""
echo "dependencies {"
echo "    implementation '${GROUP_ID}:${ARTIFACT_ID}:${VERSION}'"
echo "}"
