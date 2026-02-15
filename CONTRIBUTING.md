# Beitragen zum Maven Repository

Vielen Dank für Ihr Interesse an diesem Maven-Repository!

## Neues Artifact veröffentlichen

### Methode 1: Automatisches Skript verwenden

Das einfachste Verfahren ist die Verwendung des `publish-artifact.sh` Skripts:

```bash
./publish-artifact.sh <groupId> <artifactId> <version> <pfad-zur-aar-datei>
```

**Beispiel für sherpa-onnx:**
```bash
./publish-artifact.sh com.k2fsa.sherpa.onnx sherpa-onnx 1.0.0 /pfad/zu/sherpa-onnx.aar
```

Das Skript:
- Erstellt die Verzeichnisstruktur
- Kopiert die AAR-Datei
- Generiert die POM-Datei
- Erstellt alle Checksums (MD5 und SHA1)
- Aktualisiert die maven-metadata.xml

Nach dem Ausführen:
```bash
git add com/
git commit -m "Add sherpa-onnx version 1.0.0"
git push
```

### Methode 2: Manuell

Wenn Sie manuell vorgehen möchten, folgen Sie der Anleitung in der [README.md](README.md).

## Namenskonventionen

### GroupId
Die GroupId sollte Ihrer Organisation entsprechen:
- Format: `com.firma.produkt`
- Für sherpa-onnx: `com.k2fsa.sherpa.onnx`

### ArtifactId
Der ArtifactId sollte den Namen der Bibliothek widerspiegeln:
- Format: `bibliotheksname`
- Für sherpa-onnx: `sherpa-onnx`

### Version
Verwenden Sie [Semantic Versioning](https://semver.org/):
- Format: `MAJOR.MINOR.PATCH`
- Beispiel: `1.0.0`, `1.2.3`, `2.0.0-beta1`

## Verzeichnisstruktur

```
<groupId als Pfad>/<artifactId>/<version>/
├── <artifactId>-<version>.aar
├── <artifactId>-<version>.pom
├── <artifactId>-<version>.aar.md5
├── <artifactId>-<version>.aar.sha1
├── <artifactId>-<version>.pom.md5
└── <artifactId>-<version>.pom.sha1
```

## Checkliste vor dem Commit

- [ ] AAR-Datei ist korrekt benannt: `<artifactId>-<version>.aar`
- [ ] POM-Datei existiert und ist korrekt
- [ ] Alle Checksums wurden generiert
- [ ] maven-metadata.xml wurde aktualisiert
- [ ] README.md wurde aktualisiert (wenn neues Artifact)
- [ ] Dateien wurden getestet (lokal Maven-Repository testen)

## Testen vor der Veröffentlichung

Sie können Ihr lokales Repository testen, bevor Sie pushen:

```gradle
repositories {
    maven {
        url 'file:///pfad/zum/lokalen/maven-repo/'
    }
}

dependencies {
    implementation 'com.k2fsa.sherpa.onnx:sherpa-onnx:1.0.0'
}
```

## GitHub Pages

Nach dem Push zu `main` oder `master`:
1. Die GitHub Actions Workflow wird automatisch ausgelöst
2. Die Seite wird zu GitHub Pages deployed
3. Das Repository ist unter `https://xdcobra.github.io/maven/` verfügbar

Die Bereitstellung kann einige Minuten dauern.

## Fragen?

Bei Fragen oder Problemen öffnen Sie bitte ein Issue in diesem Repository.
