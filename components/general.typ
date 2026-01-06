// ============================================
// General UI Elements
// ============================================
#import "../styles/colors.typ": blue-100, gray-100, gray-950, red-100, yellow-100

// Highlight box with optional color
// color: "gray" (default), "blue", "red", "yellow"
#let highlight-box(
  content,
  color: "gray",
) = {
  let bg-color = if color == "blue" {
    blue-100
  } else if color == "red" {
    red-100
  } else if color == "yellow" {
    yellow-100
  } else {
    gray-100
  }

  block(
    fill: bg-color,
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: false,
  )[
    #set text(size: 10pt)
    #align(left)[
      #content
    ]
  ]
}

