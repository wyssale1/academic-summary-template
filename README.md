# Academic Summary Template

A Typst template package for academic summaries with styled components, tables, and consistent theming.

## Installation

### Option 1: Local Package (Recommended)

1. Clone the repository to your local packages directory:
```bash
# macOS
mkdir -p ~/Library/Application\ Support/typst/packages/local/academic-summary-template/0.1.0
git clone https://github.com/wyssale1/academic-summary-template.git ~/Library/Application\ Support/typst/packages/local/academic-summary-template/0.1.0

# Linux
mkdir -p ~/.local/share/typst/packages/local/academic-summary-template/0.1.0
git clone https://github.com/wyssale1/academic-summary-template.git ~/.local/share/typst/packages/local/academic-summary-template/0.1.0
```

2. Import in your document:
```typst
#import "@local/academic-summary-template:0.1.0": *
```

### Option 2: Relative Import

Clone the repository next to your project and import relatively:
```typst
#import "../academic-summary-template/lib.typ": *
```

## Quick Start

```typst
#import "@local/academic-summary-template:0.1.0": *

#show: summary-template.with(
  course: "Research Design (RDE)",
  author: "Alexander Wyss",
  title: "Zusammenfassung",
)

= Introduction

#pro-tipp[This is a pro tip!]

#warning[This is a warning!]

#chapter-summary[
  - Key point 1
  - Key point 2
]

#fancy-table(
  columns: (1fr, 1fr),
  [*Header 1*], [*Header 2*],
  [Content 1], [Content 2],
)
```

## Components

| Component           | Description                           |
| ------------------- | ------------------------------------- |
| `pro-tipp()`        | Blue tip box with lightbulb icon      |
| `warning()`         | Yellow warning box                    |
| `chapter-summary()` | Gray summary box                      |
| `fancy-table()`     | Styled table with header highlighting |
| `plot()`            | Figure wrapper with scaling           |

## Styles

| Export                     | Description                           |
| -------------------------- | ------------------------------------- |
| `summary-template()`       | Main template with page/heading setup |
| `blue-50`, `gray-100`, ... | Tailwind color palette                |
| `styled-box()`             | Styled box for plots                  |
| `main-font`                | Default font (Roboto)                 |

## License

MIT
