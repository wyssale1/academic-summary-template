// ============================================
// Tipp Components (Pro-Tipp, Warning, Chapter Summary)
// ============================================

#import "../styles/colors.typ": blue-50, blue-600, gray-100, gray-950, yellow-50, yellow-600

// Master Template for Tips/Warnings
#let master-tipp(
  content,
  title: "Tipp",
  primary-color: blue-600,
  bg-color: blue-50,
  icon-path: "/assets/lightbulb.svg",
  icon-offset: (0pt, 0pt),
) = {
  let circle-size = 18pt
  let icon-size = circle-size / 1.7

  block(above: 2em, below: 1em, breakable: false)[
    #block(
      width: 100%,
      fill: bg-color,
      radius: 4pt,
      stroke: 0.5pt + primary-color.lighten(80%),
      inset: 12pt,
    )[
      // Title
      #align(left)[
        #text(fill: primary-color, weight: "bold", size: 11pt)[#title]
      ]
      // Content (only show if not empty)
      #if content != [] [
        #v(6pt)
        #set text(size: 10pt)
        #align(left)[
          #content
        ]
      ]
    ]
    #place(top + left, dx: -circle-size / 2, dy: -circle-size / 2)[
      #box(
        width: circle-size,
        height: circle-size,
        radius: 50%,
        fill: primary-color,
        align(center + horizon)[
          #move(dx: icon-offset.at(0), dy: icon-offset.at(1))[
            #image(icon-path, width: icon-size)
          ]
        ],
      )
    ]
  ]
}

// Pro-Tipp Implementation (Blue)
#let pro-tipp(content, title: "Pro-Tipp") = {
  master-tipp(
    content,
    title: title,
    primary-color: blue-600,
    bg-color: blue-50,
    icon-path: "/assets/lightbulb.svg",
  )
}

// Alias for English usage
#let protipp = pro-tipp

// Warning Implementation (Yellow/Orange)
#let warning(content, title: "Achtung") = {
  master-tipp(
    content,
    title: title,
    primary-color: yellow-600,
    bg-color: yellow-50,
    icon-path: "/assets/triangle-alert.svg",
    icon-offset: (0pt, -0.6pt),
  )
}

// Chapter Summary Implementation (Black)
#let chapter-summary(content, title: "Wichtigstes in Kürze") = {
  master-tipp(
    content,
    title: title,
    primary-color: gray-950,
    bg-color: gray-100,
    icon-path: "/assets/list-check.svg",
    icon-offset: (0.5pt, 0pt),
  )
}
