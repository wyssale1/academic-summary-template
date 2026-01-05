// ============================================
// Page Setup with Configurable Course Name
// ============================================

#import "colors.typ": gray-400
#import "typography.typ": (
  list-indent, list-spacing, main-font, main-font-size, main-language, paragraph-leading, paragraph-spacing,
)
#import "headings.typ": apply-heading-styles

// Main template function
#let summary-template(
  course: "Kursname",
  author: "Autor",
  title: "Zusammenfassung",
  doc,
) = {
  // Page setup
  set page(
    paper: "a4",
    margin: (left: 2cm, right: 2cm, top: 2.5cm, bottom: 2.5cm),
    header: context {
      // No header on title page (page 1)
      if counter(page).get().first() == 1 {
        return
      }

      // Find chapter before AND on the current page
      let chapters-before = query(selector(heading.where(level: 1)).before(here()))
      let chapters-after = query(selector(heading.where(level: 1)).after(here()))

      // Use chapter on current page if available
      let chapter-title = if chapters-after.len() > 0 {
        let next-chapter = chapters-after.first()
        let next-page = counter(page).at(next-chapter.location()).first()
        let current-page = counter(page).get().first()

        if next-page == current-page {
          next-chapter.body
        } else if chapters-before.len() > 0 {
          chapters-before.last().body
        } else {
          [#title]
        }
      } else if chapters-before.len() > 0 {
        chapters-before.last().body
      } else {
        [#title]
      }

      set text(9pt)
      grid(
        columns: (1fr, auto),
        align: (left, right),
        strong[#course], chapter-title,
      )
      v(2pt)
      line(length: 100%, stroke: 0.5pt + gray)
    },
    footer: context {
      // No footer on title page (page 1)
      if counter(page).get().first() == 1 {
        return
      }

      set text(size: 9pt, fill: gray)
      line(length: 100%, stroke: 0.5pt + gray)
      v(4pt)
      [#author]
      h(1fr)
      counter(page).display()
    },
  )

  // Font setup
  set text(font: main-font, size: main-font-size, lang: main-language)

  // Heading numbering
  set heading(numbering: "1.1")

  // Paragraph spacing
  set par(leading: paragraph-leading, spacing: paragraph-spacing)

  // List styling
  set list(indent: list-indent, spacing: list-spacing)
  set enum(indent: list-indent, spacing: list-spacing)

  // Caption styling
  show figure.caption: caption => {
    set align(center)
    set text(style: "italic", fill: rgb("#45556c"), size: 9pt)
    caption
  }

  // Quote styling
  set quote(block: true)
  show quote: set pad(x: 5em)
  show quote: set text(style: "italic")

  // Apply heading styles
  show: apply-heading-styles

  doc
}
