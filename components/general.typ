// ============================================
// General UI Elements
// ============================================
#import "../styles/colors.typ": gray-100, gray-950

#let highlight-box(
  content,
) = {
  block(
    fill: gray-100,
    inset: 12pt,
    radius: 4pt,
    width: 100%,
  )[
    #set text(size: 10pt)
    #align(left)[
      #content
    ]
  ]
}
