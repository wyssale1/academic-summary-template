// ============================================
// Inline Symbols
// ============================================
// Reusable symbols for inline text usage

#import "../styles/colors.typ": gray-500, green-600

// Empty checkbox - inline use
#let cb = box(
  baseline: 0%,
  width: 0.7em,
  height: 0.7em,
  stroke: 0.5pt + gray-500,
  radius: 1pt,
)

// Checked checkbox - inline use
#let cb-checked = box(
  baseline: 0%,
  width: 0.7em,
  height: 0.7em,
  stroke: 0.5pt + green-600,
  radius: 1pt,
  fill: green-600,
)[
  #set align(center + horizon)
  #text(size: 0.5em, fill: white, weight: "bold")[✓]
]

// Radio button (empty circle)
#let radio = box(
  baseline: 0%,
  width: 0.7em,
  height: 0.7em,
  stroke: 0.5pt + gray-500,
  radius: 50%,
)

// Radio button (filled)
#let radio-checked = box(
  baseline: 0%,
  width: 0.7em,
  height: 0.7em,
  stroke: 0.5pt + green-600,
  radius: 50%,
  fill: green-600,
)

