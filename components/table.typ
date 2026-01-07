// ============================================
// Table Component
// ============================================

#import "../styles/colors.typ": gray-100, gray-400

// fancy-table with optional repeating header
// - breakable: true = table can break across pages
// - header-repeat: true = header repeats on each page (only when breakable=true)
#let fancy-table(
  columns: auto,
  breakable: false,
  header-repeat: true,
  ..args,
) = {
  show list: set list(indent: 0em, body-indent: 0.5em)
  show enum: set enum(indent: 0em, body-indent: 0.5em)

  // Get positional arguments (table cells)
  let cells = args.pos()

  // Determine number of columns
  let num-cols = if type(columns) == array {
    columns.len()
  } else if type(columns) == int {
    columns
  } else {
    // auto - try to infer from first row, default to 1
    1
  }

  // Split header (first row) from body
  let header-cells = cells.slice(0, calc.min(num-cols, cells.len()))
  let body-cells = if cells.len() > num-cols {
    cells.slice(num-cols)
  } else {
    ()
  }

  block(
    breakable: breakable,
    table(
      columns: columns,
      inset: 5pt,
      fill: (_, row) => if row == 0 { gray-100 } else { none },
      stroke: 0.5pt + gray-400,

      // Header with optional repeat
      ..if breakable and header-repeat {
        (table.header(..header-cells),)
      } else {
        header-cells
      },

      // Body cells
      ..body-cells,

      // Named arguments (like align, etc.)
      ..args.named(),
    ),
  )
}

