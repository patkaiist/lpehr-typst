#import "conf.typ": *
#show: conf.with(
  title: [
    Journal template for MarkDown with Typst
  ],
  authors_short: [
    van Dam
  ],
  authors: (
    (
      name: [
        Kellen Parker #smallcaps([van Dam])
      ],
      affiliations: "b,c",
      email: "kellenparker@gmail.com",
      orcid: "0000-0002-7304-1685",
    ),
  ),
  affiliations: (
   (id: "a", name: "Nagaland University"),
   (id: "b", name: "Universitat Passau"),
   (id: "c", name: "La Trobe University"),
  ),
  abstract: [
    This is the template for _Languages and Peoples of the Eastern Himalayan Region (LPEHR)_ redone from the previous LaTeX template used in 22.2 and 23.2, instead redone in the Markdown-based Typst system (#link("https://typst.app/")). It offers easier formatting than the previous template, with greater consistency in terms of spacing, handling multiple authors and affiliations, and in general provides an easier way to typeset the submissions of contributors. Since the papers are handled entirely in Markdown, there is no need to learn LaTeX, install various packages locally, or have an account with services such as Overleaf.
  ],
  keywords: ("typesetting", "publication", "journals"),
  volume: "24",
  pages: "3-12"
)
