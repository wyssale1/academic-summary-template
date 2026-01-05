// ============================================
// Exam Question Components
// ============================================
// Components for creating exam questions with solution toggle

#import "../styles/colors.typ": *

// ============================================
// Exam Template (Page Setup)
// ============================================
// Use this as show rule: #show: exam-template
#let exam-template(
  font: "Roboto",
  font-size: 10pt,
  margin: 2cm,
  body,
) = {
  set page(margin: margin)
  set text(font: font, size: font-size)
  body
}

// ============================================
// State for Point Tracking
// ============================================
#let exam-points = state("exam-points", 0)

// Helper to add points
#let add-points(points) = {
  exam-points.update(p => p + points)
}

// ============================================
// Checkbox Symbols
// ============================================
#let checkbox-empty = box(
  width: 12pt,
  height: 12pt,
  stroke: 0.5pt + gray-400,
  radius: 2pt,
  fill: white,
)

#let checkbox-checked(color: green-600) = box(
  width: 12pt,
  height: 12pt,
  stroke: 0.5pt + color,
  radius: 2pt,
  fill: green-50,
  align(center + horizon)[
    #text(fill: color, size: 9pt, weight: "bold")[✓]
  ],
)

// ============================================
// KPRIM Question Component
// ============================================
// Each statement must be marked as Richtig or Falsch

#let kprim(
  title: "Aufgabe",
  points: 2,
  context-text: none,
  statements: (),
  show-solutions: false,
) = {
  add-points(points)

  block(spacing: 1.5em, breakable: false)[
    // Title with points
    #text(weight: "bold", size: 11pt)[
      #underline[#title (#points Punkte):]
    ]

    // Optional context
    #if context-text != none [
      #v(0.3em)
      #text(size: 10pt)[#context-text]
    ]

    #v(0.5em)

    // Table with statements
    #block(breakable: false)[
      #table(
        columns: (1fr, auto, auto),
        inset: 8pt,
        stroke: 0.5pt + gray-400,
        fill: (col, row) => if row == 0 { gray-100 } else { none },
        align: (left, center, center),

        // Header
        [], [*Richtig*], [*Falsch*],

        // Statements
        ..statements
          .enumerate()
          .map(((i, stmt)) => {
            let (text-content, is-correct) = stmt
            let num = str(i + 1) + "."

            (
              [#num #text-content],
              if show-solutions and is-correct { checkbox-checked() } else { checkbox-empty },
              if show-solutions and not is-correct { checkbox-checked() } else { checkbox-empty },
            )
          })
          .flatten(),
      )
    ]
  ]
}

// ============================================
// Multiple Choice Component
// ============================================
// Only correct statements should be checked

#let multiple-choice(
  title: "Aufgabe",
  points: 1,
  question: none,
  options: (),
  show-solutions: false,
) = {
  add-points(points)

  block(spacing: 1.5em, breakable: false)[
    // Title with points
    #text(weight: "bold", size: 11pt)[
      #underline[#title (#points Punkte):]
    ]

    // Optional question text
    #if question != none [
      #v(0.3em)
      #text(size: 10pt)[#question]
    ]

    #v(0.5em)

    // Table with options
    #block(breakable: false)[
      #table(
        columns: (1fr, auto),
        inset: 8pt,
        stroke: 0.5pt + gray-400,
        fill: (col, row) => if row == 0 { gray-100 } else { none },
        align: (left, center),

        // Header
        [], [*Richtig*],

        // Options
        ..options
          .enumerate()
          .map(((i, opt)) => {
            let (text-content, is-correct) = opt
            let num = str(i + 1) + "."

            (
              [#num #text-content],
              if show-solutions and is-correct { checkbox-checked() } else { checkbox-empty },
            )
          })
          .flatten(),
      )
    ]
  ]
}

// ============================================
// Open Question Component
// ============================================
// Text field for written answers

#let open-question(
  title: "Aufgabe",
  points: 3,
  context-text: none,
  question: none,
  answer-lines: 8,
  solution: none,
  show-solutions: false,
) = {
  add-points(points)

  block(spacing: 1.5em, breakable: false)[
    // Title with points
    #text(weight: "bold", size: 11pt)[
      #underline[#title (#points Punkte):]
    ]

    // Optional context
    #if context-text != none [
      #v(0.3em)
      #text(size: 10pt)[#context-text]
    ]

    // Question text
    #if question != none [
      #v(0.3em)
      #text(size: 10pt, weight: "medium")[#question]
    ]

    #v(0.5em)

    // Answer area
    #block(breakable: false)[
      #box(
        width: 100%,
        stroke: 0.5pt + gray-400,
        radius: 2pt,
        inset: 10pt,
        fill: if show-solutions { green-50 } else { white },
      )[
        #if show-solutions and solution != none [
          // Show solution
          #text(size: 10pt, fill: green-800)[
            *Musterlösung:*
            #v(0.3em)
            #solution
          ]
        ] else [
          // Empty lined area
          #for i in range(answer-lines) [
            #v(1.2em)
            #line(length: 100%, stroke: 0.3pt + gray-300)
          ]
        ]
      ]
    ]
  ]
}

// ============================================
// Exam Summary Component
// ============================================
// Shows total points

#let exam-summary() = context {
  let total = exam-points.final()
  block(spacing: 1.5em)[
    #box(
      width: 100%,
      fill: gray-100,
      stroke: 0.5pt + gray-400,
      radius: 4pt,
      inset: 12pt,
    )[
      #align(center)[
        #text(weight: "bold", size: 12pt)[
          Gesamtpunktzahl: #total Punkte
        ]
      ]
    ]
  ]
}

// ============================================
// Exam Header Component (Optional)
// ============================================
#let exam-header(
  module: "Modulname",
  semester: "HS24",
  date: none,
  duration: "90 Minuten",
) = {
  let date-line = if date != none { [*Datum:* #date] } else { [] }

  block(spacing: 2em)[
    #box(
      width: 100%,
      stroke: 0.5pt + gray-400,
      inset: 12pt,
    )[
      #table(
        columns: (1fr, 1fr),
        stroke: none,
        inset: 0pt,
        [*Modul:* #module \ *Semester:* #semester], [#date-line \ *Dauer:* #duration],
      )
      #v(1em)
      #line(length: 100%, stroke: 0.3pt + gray-300)
      #v(0.5em)
      *Name:* #box(width: 60%, stroke: (bottom: 0.5pt + gray-400))
    ]
  ]
}

