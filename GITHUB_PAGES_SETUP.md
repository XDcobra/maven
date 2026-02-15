# GitHub Pages Einrichtung

## Schritt-für-Schritt Anleitung zur Aktivierung von GitHub Pages

### 1. Repository-Einstellungen öffnen

Besuchen Sie: https://github.com/XDcobra/maven/settings/pages

### 2. Build and Deployment konfigurieren

**Source (Quelle):**
- Wählen Sie: `Deploy from a branch`

**Branch:**
- Branch: `main` (oder `master`, je nachdem welcher Branch existiert)
- Folder: `/ (root)`

**Klicken Sie auf "Save"**

### 3. Warten Sie auf Deployment

- GitHub wird automatisch die GitHub Actions Workflow auslösen
- Dies dauert normalerweise 1-2 Minuten
- Sie können den Fortschritt unter https://github.com/XDcobra/maven/actions überwachen

### 4. Überprüfen Sie die URL

Nach erfolgreichem Deployment ist Ihr Maven Repository verfügbar unter:
```
https://xdcobra.github.io/maven/
```

### 5. Testen Sie die Konfiguration

Öffnen Sie die URL im Browser. Sie sollten die Index-Seite mit Informationen über das Maven Repository sehen.

## GitHub Actions Workflow

Die Datei `.github/workflows/pages.yml` ist bereits konfiguriert und wird automatisch:
- Bei jedem Push zu `main` oder `master` ausgelöst
- Die Repository-Inhalte zu GitHub Pages deployen
- Die URL aktualisieren

## Fehlerbehebung

### GitHub Pages zeigt "404 - File not found"

**Lösung:**
1. Überprüfen Sie, ob GitHub Pages in den Einstellungen aktiviert ist
2. Stellen Sie sicher, dass der richtige Branch ausgewählt ist
3. Warten Sie 2-5 Minuten nach der ersten Aktivierung
4. Löschen Sie den Browser-Cache und versuchen Sie es erneut

### GitHub Actions Workflow schlägt fehl

**Lösung:**
1. Gehen Sie zu https://github.com/XDcobra/maven/actions
2. Klicken Sie auf den fehlgeschlagenen Workflow
3. Überprüfen Sie die Fehlerprotokolle
4. Stellen Sie sicher, dass die Berechtigungen korrekt sind:
   - Settings → Actions → General
   - Workflow permissions: "Read and write permissions"

### Seite wird nicht aktualisiert

**Lösung:**
1. Überprüfen Sie den GitHub Actions Tab
2. Warten Sie, bis der Workflow abgeschlossen ist
3. Es kann bis zu 10 Minuten dauern, bis Änderungen sichtbar sind
4. Löschen Sie den Browser-Cache

## Permissions (Berechtigungen)

Die GitHub Actions benötigen folgende Berechtigungen (bereits in der Workflow-Datei konfiguriert):
- `contents: read` - Lesen des Repository-Inhalts
- `pages: write` - Schreiben zu GitHub Pages
- `id-token: write` - OIDC Token für Deployment

Diese werden automatisch von GitHub gewährt, wenn GitHub Pages aktiviert ist.

## Custom Domain (Optional)

Wenn Sie eine eigene Domain verwenden möchten:

1. Gehen Sie zu Settings → Pages
2. Geben Sie Ihre Domain unter "Custom domain" ein
3. Folgen Sie den Anweisungen zur DNS-Konfiguration
4. Aktivieren Sie "Enforce HTTPS" nach erfolgreicher Verifizierung

## Weitere Informationen

- [GitHub Pages Dokumentation](https://docs.github.com/en/pages)
- [GitHub Actions Dokumentation](https://docs.github.com/en/actions)
- [Jekyll Themes](https://pages.github.com/themes/)
