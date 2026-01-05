// ============================================
// Plot Helper
// ============================================

#let plot(plot-content, scaling: 95%) = {
  figure(
    scale(
      scaling,
      plot-content,
    ),
  )
}
