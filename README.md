# Academic Summary Template

A Typst template package for academic summaries with styled components, tables, and consistent theming.

## Installation

> **Hinweis**: Typst unterstützt derzeit **keinen direkten Import von GitHub URLs**. Das Package muss lokal installiert werden, aber mit dem Symlink-Ansatz werden Änderungen automatisch übernommen.

### Option 1: Symlink (Empfohlen - Auto-Update)

Mit dieser Methode werden Änderungen am Repository automatisch übernommen:

```bash
# 1. Repository an beliebigen Ort klonen
git clone https://github.com/wyssale1/academic-summary-template.git ~/projects/academic-summary-template

# 2. Symlink erstellen (macOS)
mkdir -p ~/Library/Application\ Support/typst/packages/local/academic-summary-template
ln -sf ~/projects/academic-summary-template ~/Library/Application\ Support/typst/packages/local/academic-summary-template/0.1.0

# Linux: ~/.local/share/typst/packages/local/ statt ~/Library/Application Support/typst/packages/local/
```

**Updates ziehen:**
```bash
cd ~/projects/academic-summary-template
git pull
```

### Option 2: Direkte Installation

```bash
# macOS
mkdir -p ~/Library/Application\ Support/typst/packages/local/academic-summary-template/0.1.0
git clone https://github.com/wyssale1/academic-summary-template.git ~/Library/Application\ Support/typst/packages/local/academic-summary-template/0.1.0

# Linux
mkdir -p ~/.local/share/typst/packages/local/academic-summary-template/0.1.0
git clone https://github.com/wyssale1/academic-summary-template.git ~/.local/share/typst/packages/local/academic-summary-template/0.1.0
```

### Option 3: Relativer Import

Repository neben dein Projekt klonen:
```typst
#import "../academic-summary-template/lib.typ": *
```

---

## Import in deinem Dokument

```typst
#import "@local/academic-summary-template:0.1.0": *

#show: summary-template.with(
  // Required
  course: "Research Design (RDE)",
  author: "Alexander Wyss",
  // Optional
  title: "Zusammenfassung",
  subtitle: "Erstellt für Unternehmensentwicklung (MSc)",
  title-image: image("assets/title-image.jpg", width: 100%),
  show-toc: true,                    // Inhaltsverzeichnis (default: true)
  toc-title: "Inhaltsverzeichnis",   // TOC Titel
)

// Jetzt direkt mit den Kapiteln beginnen - Title Page + TOC werden automatisch generiert
= Kapitel 1
#pro-tipp[Ein hilfreicher Tipp!]
```

---

## Komponenten

| Komponente          | Beschreibung                         |
| ------------------- | ------------------------------------ |
| `pro-tipp()`        | Blauer Tipp-Kasten mit Glühbirne     |
| `warning()`         | Gelber Warnungs-Kasten               |
| `chapter-summary()` | Grauer Zusammenfassungs-Kasten       |
| `fancy-table()`     | Styled Table mit Header-Highlighting |
| `plot()`            | Figure-Wrapper mit Skalierung        |

## Styles

| Export                     | Beschreibung                          |
| -------------------------- | ------------------------------------- |
| `summary-template()`       | Haupt-Template mit Page/Heading Setup |
| `blue-50`, `gray-100`, ... | Tailwind-Farbpalette                  |
| `styled-box()`             | Styled Box für Plots                  |
| `main-font`                | Standard-Schriftart (Roboto)          |

---

## Versionierung & Updates

### Neue Version erstellen (für Package-Maintainer)

1. **Version in `typst.toml` anpassen:**
```toml
[package]
version = "0.2.0"  # <- erhöhen
```

2. **Änderungen committen und pushen:**
```bash
git add -A
git commit -m "Release v0.2.0: Beschreibung der Änderungen"
git push origin main
```

3. **Optional: Git Tag erstellen** (empfohlen für stabile Releases):
```bash
git tag v0.2.0
git push origin v0.2.0
```

### Als Nutzer: Auf neue Version updaten

```bash
# Bei Symlink-Installation:
cd ~/projects/academic-summary-template
git pull

# Falls du einen bestimmten Tag willst:
git checkout v0.2.0
```

**Wichtig**: Bei Symlink-Installation musst du ggf. den Symlink-Pfad anpassen wenn sich die Major-Version ändert (z.B. `0.1.0` → `1.0.0`).

---

## Lizenz

MIT
