// ============================================
// Table Component
// ============================================

#import "../styles/colors.typ": gray-100, gray-400

#let fancy-table(
  columns: auto,
  breakable: false,
  ..args,
) = {
  show list: set list(indent: 0em, body-indent: 0.5em)
  show enum: set enum(indent: 0em, body-indent: 0.5em)

  block(
    breakable: breakable,
    table(
      columns: columns,
      inset: 5pt,
      fill: (_, row) => if row == 0 { gray-100 } else { none },
      stroke: 0.5pt + gray-400,

      ..args
    ),
  )
}
