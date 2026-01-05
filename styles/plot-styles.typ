// ============================================
// Global Plot Styles
// ============================================
// Standardized styles for all plots

#import "colors.typ": blue-200, blue-500, gray-200, gray-400, gray-950

// Box Styling
#let box-fill = gray-200
#let box-stroke = 0.5pt + gray-400
#let box-radius = 4pt
#let box-padding = 8pt
#let box-inset = 8pt

// Text Styling
#let text-color = gray-950
#let text-size-normal = 11pt
#let text-size-small = 9pt

// Label Styling (for badges/labels in plots)
#let label-fill = blue-200
#let label-stroke = 1pt + blue-500
#let label-text-color = rgb("#1a365d")

// Helper function for consistent nodes
#let styled-box(content, width: auto, height: auto, align: center + horizon) = {
  box(
    width: width,
    height: height,
    fill: box-fill,
    stroke: box-stroke,
    radius: box-radius,
    inset: box-padding,
  )[
    #set align(align)
    #set text(fill: text-color, size: text-size-normal)
    #content
  ]
}
