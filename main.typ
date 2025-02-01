#import "@preview/orange-book:0.5.0": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image

//#set text(font: "Linux Libertine")
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#show: book.with(
  title: "Lambda Calculus",
  subtitle: "A Concise but Comprehensive Introduction",
  date: "Anno scolastico 2023-2024",
  author: "Xingyu Yang",
  main-color: rgb("#F36619"),
  lang: "en",
  cover: image("./background.svg"),
  image-index: image("./orange1.jpg"),
  list-of-figure-title: "List of Figures",
  list-of-table-title: "List of Tables",
  supplement-chapter: "Chapter",
  supplement-part: "Part",
  part-style: 0,
  copyright: [
    #link("https://github.com/flavio20002/typst-orange-template", "TEMPLATE-WEBSITE")

    Licensed under the Apache 2.0 License (the “License”).
    You may not use this file except in compliance with the License. You may obtain a copy of
    the License at https://www.apache.org/licenses/LICENSE-2.0. Unless required by
    applicable law or agreed to in writing, software distributed under the License is distributed on an
    “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.

    _First printing, July 2023_
  ],
  lowercase-references: false
)

#part("Type-free Lambda Calculus") 

#chapter("Introduction", image: image("./orange2.jpg"), l: "chap1")
#include "Chapters/1-Introduction.typ"

#chapter("Basics of Type-free Lambda Calculus", image: image("./orange2.jpg"), l: "chap1")
#include "Chapters/2-Type-free Calculus.typ"

#index("Sectioning!Sections")




#part("Typed Lambda Calculus") 

#chapter("Introduction", image: image("./orange2.jpg"), l: "chap1")
#lorem(50)

#my-bibliography( bibliography("sample.bib"))

//#make-index(title: "Index")

