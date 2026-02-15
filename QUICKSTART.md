# Schnellstart-Anleitung

## 1. GitHub Pages aktivieren

1. Gehen Sie zu: https://github.com/XDcobra/maven/settings/pages
2. Unter "Build and deployment":
   - **Source**: Deploy from a branch
   - **Branch**: Wählen Sie `main` (oder `master`) und `/` (root)
3. Klicken Sie auf "Save"
4. Warten Sie einige Minuten, bis die Seite bereitgestellt wird
5. Die URL wird sein: `https://xdcobra.github.io/maven/`

## 2. Erste AAR-Datei veröffentlichen

### Option A: Mit dem Skript (empfohlen)

```bash
# Syntax
./publish-artifact.sh <groupId> <artifactId> <version> <pfad-zur-aar-datei>

# Beispiel für sherpa-onnx
./publish-artifact.sh com.k2fsa.sherpa.onnx sherpa-onnx 1.0.0 /pfad/zu/sherpa-onnx.aar

# Dann committen und pushen
git add com/
git commit -m "Add sherpa-onnx version 1.0.0"
git push
```

### Option B: Manuell

```bash
# Verzeichnis erstellen
mkdir -p com/k2fsa/sherpa/onnx/sherpa-onnx/1.0.0
cd com/k2fsa/sherpa/onnx/sherpa-onnx/1.0.0

# AAR kopieren
cp /pfad/zu/ihrer.aar sherpa-onnx-1.0.0.aar

# POM erstellen
cat > sherpa-onnx-1.0.0.pom <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.k2fsa.sherpa.onnx</groupId>
  <artifactId>sherpa-onnx</artifactId>
  <version>1.0.0</version>
  <packaging>aar</packaging>
</project>
EOF

# Checksums generieren
md5sum sherpa-onnx-1.0.0.aar | cut -d' ' -f1 > sherpa-onnx-1.0.0.aar.md5
sha1sum sherpa-onnx-1.0.0.aar | cut -d' ' -f1 > sherpa-onnx-1.0.0.aar.sha1
md5sum sherpa-onnx-1.0.0.pom | cut -d' ' -f1 > sherpa-onnx-1.0.0.pom.md5
sha1sum sherpa-onnx-1.0.0.pom | cut -d' ' -f1 > sherpa-onnx-1.0.0.pom.sha1

# Zurück zum Root
cd ../../../../../..

# maven-metadata.xml aktualisieren (siehe README.md für Details)

# Committen
git add com/
git commit -m "Add sherpa-onnx version 1.0.0"
git push
```

## 3. In Android-Projekt verwenden

```gradle
// build.gradle
repositories {
    maven {
        url 'https://xdcobra.github.io/maven/'
    }
}

dependencies {
    implementation 'com.k2fsa.sherpa.onnx:sherpa-onnx:1.0.0'
}
```

## 4. Überprüfen

Nach dem Push:
1. Warten Sie 1-2 Minuten
2. Besuchen Sie: https://xdcobra.github.io/maven/
3. Überprüfen Sie die Actions: https://github.com/XDcobra/maven/actions
4. Testen Sie die Maven-URL in Ihrem Projekt

## Wichtige Links

- **GitHub Pages URL**: https://xdcobra.github.io/maven/
- **Repository**: https://github.com/XDcobra/maven
- **Settings**: https://github.com/XDcobra/maven/settings/pages
- **Actions**: https://github.com/XDcobra/maven/actions

## Häufige Probleme

### GitHub Pages zeigt 404
- Stellen Sie sicher, dass GitHub Pages in den Settings aktiviert ist
- Warten Sie 2-5 Minuten nach dem ersten Push
- Überprüfen Sie den Actions Tab auf Fehler

### Maven-Abhängigkeit wird nicht gefunden
- Überprüfen Sie die URL: `https://xdcobra.github.io/maven/` (mit Schrägstrich am Ende)
- Stellen Sie sicher, dass die Dateien korrekt benannt sind
- Überprüfen Sie den Pfad: `com/k2fsa/sherpa/onnx/sherpa-onnx/1.0.0/`

### Wo finde ich die react-native-sherpa-onnx AAR-Datei?
Die AAR-Datei wird normalerweise im Android-Projekt nach dem Build generiert:
```
android/app/build/outputs/aar/
```
oder
```
node_modules/react-native-sherpa-onnx/android/build/outputs/aar/
```

Bauen Sie das Projekt:
```bash
cd android
./gradlew assembleRelease
# Oder für spezifische AAR
./gradlew :react-native-sherpa-onnx:assembleRelease
```
