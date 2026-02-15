# Contributing to the Maven repository

Thank you for your interest in this Maven repository!

## Publishing a new artifact

### Method 1: Use the automation script

The easiest way is to use the `publish-artifact.sh` script:

```bash
./publish-artifact.sh <groupId> <artifactId> <version> <path-to-aar-file>
```

Example for sherpa-onnx:
```bash
./publish-artifact.sh com.k2fsa.sherpa.onnx sherpa-onnx 1.0.0 /path/to/sherpa-onnx.aar
```

The script:
- Creates the directory structure
- Copies the AAR file
- Generates the POM file
- Creates all checksums (MD5 and SHA1)
- Updates `maven-metadata.xml`

After running the script:
```bash
git add com/
git commit -m "Add sherpa-onnx version 1.0.0"
git push
```

### Method 2: Manual

If you prefer to do it manually, follow the instructions in the `README.md`.

## Naming conventions

### GroupId
The GroupId should reflect your organization:
- Format: `com.company.product`
- For sherpa-onnx: `com.k2fsa.sherpa.onnx`

### ArtifactId
The ArtifactId should reflect the library name:
- Format: `library-name`
- For sherpa-onnx: `sherpa-onnx`

### Version
Use Semantic Versioning: https://semver.org/
- Format: `MAJOR.MINOR.PATCH`
- Examples: `1.0.0`, `1.2.3`, `2.0.0-beta1`

## Directory layout

```
<groupId as path>/<artifactId>/<version>/
├── <artifactId>-<version>.aar
├── <artifactId>-<version>.pom
├── <artifactId>-<version>.aar.md5
├── <artifactId>-<version>.aar.sha1
├── <artifactId>-<version>.pom.md5
└── <artifactId>-<version>.pom.sha1
```

## Checklist before committing

- [ ] AAR file is named correctly: `<artifactId>-<version>.aar`
- [ ] POM file exists and is correct
- [ ] All checksums have been generated
- [ ] `maven-metadata.xml` has been updated
- [ ] `README.md` has been updated (if adding a new artifact)
- [ ] Files have been tested (try a local Maven repo)

## Testing before publishing

You can test your local repository before pushing:

```gradle
repositories {
    maven {
        url 'file:///path/to/local/maven-repo/'
    }
}

dependencies {
    implementation 'com.k2fsa.sherpa.onnx:sherpa-onnx:1.0.0'
}
```

## GitHub Pages

After pushing to `main` or `master`:
1. The GitHub Actions workflow will run automatically
2. The site will be deployed to GitHub Pages
3. The repository will be available at `https://xdcobra.github.io/maven/`

Deployment may take a few minutes.

## Questions?

If you have questions or run into issues, please open an issue in this repository.
