#import "conf.typ": *
#set par.line(numbering: "1")
#show: conf.with(
  title: [
    Journal template for Typst markup
  ],
  authors_short: [
    van Dam
  ],
  authors: (
    (
      name: [
        Kellen Parker #smallcaps([van Dam])
      ],
      affiliations: "a,b",
      email: "kellenparker@gmail.com",
      orcid: "0000-0002-7304-1685",
    ),
  ),
  affiliations: (
   (id: "a", name: "Universitat Passau"),
   (id: "b", name: "La Trobe University"),
  ),
  abstract: [
    This is the template for _Languages and Peoples of the Eastern Himalayan Region (LPEHR)_ redone from the previous LaTeX template used in 22.2 and 23.2, instead redone in the Markdown-based Typst system (#link("https://typst.app/")). It offers easier formatting than the previous template, with greater consistency in terms of spacing, handling multiple authors and affiliations, and in general provides an easier way to typeset the submissions of contributors. Since the papers are handled entirely in Markdown, there is no need to learn LaTeX, install various packages locally, or have an account with services such as Overleaf.
  ],
  keywords: ("typesetting", "publication", "journals"),
  volume: "24",
  pages: "3-12"
)

= Introduction

Citations are in APA format. New commands have been written for author plus year in parentheses, i.e. #autocite("abramson2004plausibility"), full enclosed in parentheses #citep("abramson1977diachronic"), or just the year, e.g. #citeyear("acconedarryl2006ghost") for #autocite("acconedarryl2006ghost").

= Second heading

#lorem(50)

#lorem(150)

#lorem(100)

#lorem(50)

#lorem(150)

#lorem(100)

#lorem(50)

#lorem(150)

#lorem(100)

#lorem(50)

#lorem(150)

#lorem(100)