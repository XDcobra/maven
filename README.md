# Maven Repository

Dieses Repository dient als benutzerdefiniertes Maven-Repository zum Hosten von Android .aar-Dateien über GitHub Pages.

[🌐 Repository URL: https://xdcobra.github.io/maven/](https://xdcobra.github.io/maven/)

## Verfügbare Artifacts

### react-native-sherpa-onnx

Um dieses Artifact in Ihrem Projekt zu verwenden, fügen Sie Folgendes zu Ihrer `build.gradle` hinzu:

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

Ersetzen Sie `VERSION` durch die gewünschte Versionsnummer.

## Neues Artifact veröffentlichen

### Schritt 1: AAR-Datei erstellen

Bauen Sie Ihre .aar-Datei mit Ihrem Android-Projekt.

### Schritt 2: Verzeichnisstruktur erstellen

```bash
# Beispiel für sherpa-onnx Version 1.0.0
mkdir -p com/k2fsa/sherpa/onnx/sherpa-onnx/1.0.0
cd com/k2fsa/sherpa/onnx/sherpa-onnx/1.0.0
```

### Schritt 3: Dateien hinzufügen

Fügen Sie die folgenden Dateien zum Versionsverzeichnis hinzu:

1. **AAR-Datei**: `sherpa-onnx-1.0.0.aar`
2. **POM-Datei**: `sherpa-onnx-1.0.0.pom` (siehe Beispiel unten)
3. **Checksums** (optional, aber empfohlen):
   ```bash
   md5sum sherpa-onnx-1.0.0.aar | cut -d' ' -f1 > sherpa-onnx-1.0.0.aar.md5
   sha1sum sherpa-onnx-1.0.0.aar | cut -d' ' -f1 > sherpa-onnx-1.0.0.aar.sha1
   md5sum sherpa-onnx-1.0.0.pom | cut -d' ' -f1 > sherpa-onnx-1.0.0.pom.md5
   sha1sum sherpa-onnx-1.0.0.pom | cut -d' ' -f1 > sherpa-onnx-1.0.0.pom.sha1
   ```

### Schritt 4: POM-Datei erstellen

Beispiel `sherpa-onnx-1.0.0.pom`:

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
  <description>Sherpa ONNX library for Android from react-native-sherpa-onnx</description>
</project>
```

### Schritt 5: maven-metadata.xml aktualisieren

Aktualisieren Sie die Datei `com/k2fsa/sherpa/onnx/sherpa-onnx/maven-metadata.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<metadata>
  <groupId>com.k2fsa.sherpa.onnx</groupId>
  <artifactId>sherpa-onnx</artifactId>
  <versioning>
    <latest>1.0.0</latest>
    <release>1.0.0</release>
    <versions>
      <version>1.0.0</version>
    </versions>
    <lastUpdated>20260215090900</lastUpdated>
  </versioning>
</metadata>
```

### Schritt 6: Committen und pushen

```bash
git add .
git commit -m "Add sherpa-onnx version 1.0.0"
git push
```

### Schritt 7: GitHub Pages aktivieren

1. Gehen Sie zu den Repository-Einstellungen
2. Navigieren Sie zu "Pages"
3. Wählen Sie als Source den Branch (z.B. `main` oder `master`)
4. Das Repository wird unter `https://xdcobra.github.io/maven/` verfügbar sein

## Repository-Struktur

```
maven/
├── README.md                           # Diese Datei
├── index.md                            # GitHub Pages Index
├── _config.yml                         # Jekyll-Konfiguration
├── .gitignore                          # Git-Ignore-Datei
└── com/
    └── k2fsa/
        └── sherpa/
            └── onnx/
                └── sherpa-onnx/
                    ├── maven-metadata.xml
                    ├── README.md
                    └── [version]/
                        ├── sherpa-onnx-[version].aar
                        ├── sherpa-onnx-[version].pom
                        ├── sherpa-onnx-[version].aar.md5
                        ├── sherpa-onnx-[version].aar.sha1
                        ├── sherpa-onnx-[version].pom.md5
                        └── sherpa-onnx-[version].pom.sha1
```

## Verwendung in Android-Projekten

### Gradle (Kotlin DSL)

```kotlin
repositories {
    maven {
        url = uri("https://xdcobra.github.io/maven/")
    }
}

dependencies {
    implementation("com.k2fsa.sherpa.onnx:sherpa-onnx:1.0.0")
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
    implementation 'com.k2fsa.sherpa.onnx:sherpa-onnx:1.0.0'
}
```

## Hinweise

- Dieses Repository verwendet GitHub Pages für das Hosting
- Die Maven-Metadaten folgen dem Standard-Maven-Repository-Layout
- Checksums (MD5/SHA1) sind optional, werden aber für die Integrität empfohlen
- Jede Version sollte ihr eigenes Verzeichnis haben