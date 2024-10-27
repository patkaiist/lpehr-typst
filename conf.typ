#let orcidLogo(
  orcid: none,
) = {
  let orcidSvg = ```<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 24 24"><path fill="#AECD54" d="M21.8,12c0,5.4-4.4,9.8-9.8,9.8S2.2,17.4,2.2,12S6.6,2.2,12,2.2S21.8,6.6,21.8,12z M8.2,5.8c-0.4,0-0.8,0.3-0.8,0.8s0.3,0.8,0.8,0.8S9,7,9,6.6S8.7,5.8,8.2,5.8z M10.5,15.4h1.2v-6c0,0-0.5,0,1.8,0s3.3,1.4,3.3,3s-1.5,3-3.3,3s-1.9,0-1.9,0H10.5v1.1H9V8.3H7.7v8.2h2.9c0,0-0.3,0,3,0s4.5-2.2,4.5-4.1s-1.2-4.1-4.3-4.1s-3.2,0-3.2,0L10.5,15.4z"/></svg>```.text
  if (orcid == none) {
    box(height: .7em, baseline: -20%, [#image.decode(orcidSvg)])
    return
  }
  link("https://orcid.org/" + orcid)[#box(height: .7em, baseline: -20%)[#image.decode(orcidSvg)]]
}
#let autocite(key) = {cite(label(key),form: "author")+" ("+cite(label(key),form: "year")+")"}
#let citep(key) = {"("+cite(label(key),form: "author")+" "+cite(label(key),form: "year")+")"}
#let citeyear(key) = {cite(label(key),form: "year")}
#let titlepage_authors(authors,affiliations) = {
  if authors.len() > 0 {
    for author in authors [
      #block(above: 0em, below: 1.75em)[
        #text(size: 12pt)[
          #text(weight: "bold", author.name)
          #if "orcid" in author {
            orcidLogo(orcid: author.orcid)
          }
          #let all = ""
          #let a = author.affiliations.split(",")
          #block(above: 0.5em, below: 0em)[
            #let i = 0
            #for aff in a [
              #for affiliation in affiliations [
                #if affiliation.id == aff {
                  all += affiliation.name
                  if i < a.len() -1 {
                    all += ", "
                  }
                  i += 1
                }
              ]
            ]
            #all
          ]
        ]
      ]
    ]
  }
}
#let display_authors(authors) = {
  if authors.len() > 0 {
    block(above: 1em, below: 0.5em)[
      #authors.map(author => {
        author.name
        h(1pt)
        if "affiliations" in author {
          super(typographic: false)[#author.affiliations]
        }
        if "orcid" in author {
          orcidLogo(orcid: author.orcid)
        }
      }).join(", ", last: ", and ")
    ]
  }
}
#let display_affiliations(affiliations) = {
  if affiliations.len() > 0 {
    block(below: 2em)[
      #affiliations.map(affiliation => {
        super(affiliation.id)
        h(1pt)
        affiliation.name
      }).join(", ")
    ]
  }
}
#let conf(
  title: none,
  shorttitle: none,
  authors: (),
  authors_short: none,
  affiliations: (),
  abstract: [],
  keywords: (),
  volume: 0,
  pages: 0,
  doc,
) = {
  set page(
    paper: "a4",
    margin: (x: 2cm, y: 2cm),
  )
  set par(spacing: 1em)
  set heading(numbering: "1.") 
  set align(center)
  block(above: 1.25em, below: 2em)[
    #image("logo.svg", width: 50%)
  ]
  block(width: 400pt, below: 3em)[
    #set par(
      justify: true,
      linebreaks: "optimized",
    )
    #text(weight: "bold", size: 11pt, [
      #emph[Languages and Peoples of the Eastern Himalayan Region (LPEHR)] comprises an annual special issue of #emph[Himalayan Linguistics] together with occasional special publications. Peer-reviewed and open-access, it focuses on linguistic and \
      ethnographic documentation and description in the Eastern Himalaya.
    ])
  ] 
  set align(left)
  block(below: 1em)[
    #text(weight: "bold")[Languages and Peoples of the Eastern Himalayan Region (LPEHR)]
  ] 
  line(start: (0%, 0%), end: (100%, 0%), stroke: (thickness: 1pt)) 
  set align(left) 
  block(above: 1em, below: 1.75em)[
    #set text(style: "italic", size: 12pt)
    #text(size: 12pt, title)
  ] 
  let count = authors.len()
  let ncols = calc.min(count, 3) 
  set text(size: 11pt)
  set block(spacing: 0.5em)
  titlepage_authors(authors,affiliations)
  set block(spacing: 2em)
  set text(size: 11pt) 
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1em,
    linebreaks: "optimized",
  )
  set align(left)
  block(below: 2em)[
    #block(below: 1em, smallcaps("Abstract"))
    #abstract
  ]
  block(below: 2em)[
    #block(below: 1em, smallcaps("Keywords"))
    #let keyword_list = keywords.join(", ")
    #keyword_list
  ]
  v(1fr)
  block(below: 2em)[
    #set par(
      justify: true,
      linebreaks: "optimized",
    )
    #text(size: 10pt)[
      This is a contribution from 
      #emph[Himalayan Linguistics Vol #volume (2) – Languages and Peoples of the Eastern Himalayan Region]: pp. #pages. ISSN 1544-7502 © 2024. All rights reserved.
    ]
  ]
  block(below: 2em)[
    #set par(
      justify: true,
      linebreaks: "optimized",
    )
    #text(size: 10pt, [
      This Portable Document Format (PDF) file may not be altered in any way.
    ])
  ]
  block(below: 0em)[
    #set par(
      justify: true,
      linebreaks: "optimized",
    )
    #text(size: 10pt, [
      Tables of contents, abstracts, and submission guidelines are available at \
      #link("https://escholarship.org/uc/himalayanlinguistics")[escholarship.org/uc/himalayanlinguistics]
    ])
  ]
  set par(leading: 0.65em)
  set align(center)
  show heading.where(level: 1): it => [
    #set text(size: 13pt, weight: "bold")
    #block(above: 1.25em, below: 0.75em)[
      #counter(heading).display() #it.body
    ]
  ]
  let heading_alt(textvalue) = {
    block(above: 1.65em, below: 0.75em)[#text(size: 13pt, weight: "bold", textvalue)]
  }
  show heading.where(level: 2): it => [
    #set text(size: 12pt, weight: "bold")
    #block(above: 1.25em, below: 0.75em)[
      #counter(heading).display() #it.body
    ]
  ]
  show heading.where(level: 3): it => [
    #set text(style: "italic", size: 12pt)
    #block(above: 1.25em, below: 0.75em)[
      #counter(heading).display() #it.body
    ]
  ]
  set page(numbering: "1", number-align: center)
  set page(header: context {
    let short_title = if shorttitle != none { shorttitle } else { title }
    if counter(page).get().first() > 2 and calc.odd(counter(page).get().first()) [
      _Languages and Peoples of the Eastern Himalayan Region_
      #h(1fr)
    ] else if counter(page).get().first() > 2 [
      #h(1fr)
      #authors_short - #short_title
    ]
  })
  set align(center)
  set par(leading: 0.5em)
  text(size: 16pt, weight: "bold", title)
  set par(leading: 0.65em)
  let count = authors.len()
  let ncols = calc.min(count, 3)
  set text(size: 11pt)
  set block(spacing: 0.5em)
  display_authors(authors)
  set text(size: 10pt)
  display_affiliations(affiliations)
  set block(spacing: 2em)
  set text(size: 11pt)
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 0em, // this should be 1em for most cases
    linebreaks: "optimized",
  )
  set align(left)
  par(justify: true)[
    *Abstract* \
    #abstract
  ]
  set table(
    stroke: none,
    align: left,
    gutter: 0em,
    column-gutter: 0em,
    row-gutter: -0em,
    inset: (right: 1em, left: 0em),
  )
  show table.cell.where(y: 0): strong
  set block(spacing: 1em)
  set align(left)
  counter(page).update(10)
  
  doc

  set par(justify: false, leading: 0.65em, first-line-indent: 0em, linebreaks: "optimized")
  
  heading_alt("References")
  bibliography("refs.bib", style: "apa", title: none)
}
