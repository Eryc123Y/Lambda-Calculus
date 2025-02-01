can you edit this for me? I want left align #import "@preview/ctheorems:1.1.3": *
#import "@preview/gentle-clues:1.1.0"
#import "@preview/quick-maths:0.2.0"
#import "@preview/stack-pointer:0.1.0"
#import "@preview/mitex:0.2.5"
#import "@preview/algo:0.3.4"
#import "@preview/codedis:0.1.0"
#import "@preview/physica:0.9.3": *
#show: thmrules

/**

#let definition = thmbox(
 "definition", // identifier
 "Definition", // head
 fill: rgb("#e8f8e8"), // background color
)

#let theorem = thmbox(
 "theorem", // identifier
 "Theorem", // head
 fill: rgb("#e8e8f8")
)

#let lemma = thmbox(
 "theorem",
 "Lemma", 
 fill: rgb("#efe6ff")
)

#let corollary = thmbox(
 "corollary", 
 "Corollary", 
 fill: rgb("#f8e8e8")
)

#let example = thmplain(
 "example",
 "Example",
 titlefmt: strong,
).with(numbering: none)

#let remark = thmplain(
 "remark",
 "Remark",
 base: "theorem",
 titlefmt: strong,

).with(numbering: none)
 */


#let proof = thmplain(
 "proof",
 "Proof",
 titlefmt: emph,
 bodyfmt: body => [
 #body #h(1fr) $square$ // float a QED symbol to the right
 ]
).with(numbering: none)

#let lemma = thmplain(
  "lemma",
  "Lemma",
  titlefmt: strong,
)

