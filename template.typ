#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "us-letter", numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true)

  show heading.where(
    level: 1
  ): it => text[
    #set align(center)
    #pagebreak(weak:true)
    #smallcaps(it.body)
  ]

  body
}

#let question(body) = {
  rect(
    inset: 6pt,
    fill: rgb("e4e5ea"),
    width: 100%,
    radius: 8pt,
    [#body]
  )
}

#let answer(body) = {
  set text(rgb(10%, 20%, 70%)) 
  [#body]
}

#let wrong(body) = {
  set text(red) 
  [#body]
}

