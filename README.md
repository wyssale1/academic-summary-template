# Academic Summary Template

A Typst template package for academic summaries with styled components, tables, and consistent theming.

## Installation

Import directly from GitHub:

```typst
#import "@git/github.com/wyssale1/academic-summary-template:main": *
```

Or clone the repository and import locally.

## Quick Start

```typst
#import "@git/github.com/wyssale1/academic-summary-template:main": *

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
