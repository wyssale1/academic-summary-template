# Academic Summary Template - Reference

Detaillierte Dokumentation aller Komponenten und Funktionen.

## Setup

### `summary-template`
Haupt-Template für Zusammenfassungen.

```typst
#show: summary-template.with(
  course: "Modul Name",
  author: "Dein Name",
  title: "Titel", 
  subtitle: "Untertitel",
  show-toc: true
)
```

### `exam-template`
Template für Prüfungen. Setzt Seitenränder und Schriftart.

```typst
#show: exam-template.with(
  font: "Roboto",    // Default
  font-size: 10pt,   // Default
  margin: 2cm        // Default
)
```

---

## Tipp & Warnungs-Boxen

### `pro-tipp`
Blaue Box mit Glühbirne für wichtige Hinweise.

```typst
#pro-tipp(title: "Pro-Tipp")[
  Hier steht ein wichtiger Hinweis.
]
```

### `warning`
Gelbe Box mit Warndreieck für Warnungen.

```typst
#warning(title: "Achtung")[
  Dies ist prüfungsrelevant!
]
```

### `chapter-summary`
Graue Box für Kapitel-Zusammenfassungen.

```typst
#chapter-summary[
  - Punkt 1
  - Punkt 2
]
```

---

## Container & Layout

### `highlight-box`
Flexible Box mit farbigem Hintergrund.

**Parameter:**
- `color`: `"gray"` (default), `"blue"`, `"red"`, `"yellow"`, `"green"`

```typst
#highlight-box(color: "blue")[
  Dieser Text ist blau hinterlegt.
]
```

### `styled-box`
Box mit abgerundeten Ecken und Rahmen (oft für Plots verwendet).

```typst
#styled-box[Inhalt]
```

### `fancy-table`
Tabelle mit hervorgehobenem Header (grau) und standardisiertem Styling.

```typst
#fancy-table(
  columns: (1fr, 2fr),
  [Header 1], [Header 2],
  [Inhalt 1], [Inhalt 2]
)
```

---

## Prüfungs-Komponenten (`exam.typ`)

### `exam-header`
Kopfzeile für Prüfungen mit optionaler Punkteanzeige.

```typst
#exam-header(
  module: "Modul",
  semester: "HS24",
  max-points: 60  // Optional: Setzt "Max. 60 Punkte" Box oben rechts
)
```

### `kprim`
KPRIM-Frage (Richtig/Falsch Tabelle).

```typst
#kprim(
  title: "Aufgabe 1",
  points: 2,
  statements: (
    ("Aussage 1", true),
    ("Aussage 2", false),
  ),
  show-solutions: true // oder Variable übergeben
)
```

### `multiple-choice`
Multiple Choice (nur richtige ankreuzen).

```typst
#multiple-choice(
  title: "Aufgabe 2",
  options: (
    ("Option A", true),
    ("Option B", false),
  )
)
```

### `open-question`
Offene Frage mit Textfeld/Linien.

**Parameter:**
- `points`: Punkte (optional)
- `answer-lines`: Anzahl Linien (0 = keine Linien/Box)
- `solution`: Musterlösung (wird angezeigt wenn `show-solutions: true`)

```typst
#open-question(
  title: "Aufgabe 3",
  points: 4,
  question: "Erklären Sie...",
  solution: [Lösungstext...]
)
```

### `exam-summary`
Zeigt die automatisch berechnete Gesamtpunktzahl an.

```typst
#exam-summary()
```

---

## Farben

Tailwind-inspirierte Farben sind direkt verfügbar:

- `gray-50` bis `gray-950`
- `blue-50` bis `blue-950`
- `red`, `green`, `yellow`, `indigo`, `purple`, `pink`, `cyan`, `teal`, `emerald`, `orange`, `sky`, `lime`...

Beispiel: `#text(fill: blue-600)[Blauer Text]`
