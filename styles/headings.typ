// ============================================
// Heading Styles
// ============================================

#import "colors.typ": primary-color

// Heading 1 - Chapter level (starts on new page)
#let heading-1-style(it) = {
  pagebreak(weak: true)
  set text(fill: primary-color, size: 16pt, weight: "bold")
  v(18pt)
  it
  v(12pt)
}

// Heading 2 - Section level
#let heading-2-style(it) = {
  set text(size: 13pt, weight: "bold")
  v(14pt)
  it
  v(8pt)
}

// Heading 3 - Subsection level
#let heading-3-style(it) = {
  set text(size: 11pt, weight: "bold")
  v(10pt)
  it
  v(6pt)
}

// Apply all heading styles
#let apply-heading-styles(doc) = {
  show heading.where(level: 1): heading-1-style
  show heading.where(level: 2): heading-2-style
  show heading.where(level: 3): heading-3-style
  doc
}
