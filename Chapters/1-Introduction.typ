#import "@preview/orange-book:0.5.0": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image

#import "../typesetting.typ": *
== Introduction
This note delves into the theoretical foundation of computer science, focusing on the lambda calculus. Despite its name, lambda calculus is not a calculus in the traditional sense. Instead, it is a *formal system to formalize the process of computation*. Its power comes from its simplicity: the entire system is built upon just a few primitive notions such as variables, function abstraction (denoted by the Greek letter lambda, $lambda$), and function application.

Lambda calculus has had a profound impact on both theoretical computer science and pure mathematics. On one hand, it has influenced the design and implementation of modern programming languages, especially those that follow the functional programming paradigm (such as Haskell, Lisp, and ML). On the other hand, its elegant formalism has deep connections with mathematical logic, type theory, and even category theory.

In later sections of this note, we will illustrate these ideas with concrete examples and explore how these theoretical constructs serve as the backbone for advanced topics in computer science—ranging from compiler design and program optimization to the semantics of programming languages and the foundations of mathematics.

=== A Brief History
The lambda calculus was introduced in the 1930s by the mathematician and logician Alonzo Church. In an era when the foundations of mathematics were under intense scrutiny—spurred by paradoxes in naive set theory#footnote[See #link("https://en.wikipedia.org/wiki/Russell%27s_paradox")[Russell's Paradox].] and the quest for a rigorous understanding of mathematical logic—Church sought a formal system that could capture the intuitive notion of computability. His work was driven by the idea of an effective computable function (a function for which a mechanical procedure exists to compute its value) and aimed to provide a framework that was independent of any particular hardware or machine model.

Church's formulation of lambda calculus was revolutionary. By treating functions as first-class entities—capable of being passed as arguments, returned as values, and composed with other functions—he laid the groundwork for what would later evolve into functional programming. In this system, the process of computation is entirely encapsulated in the act of function application and transformation, abstracting away from any operational details. This abstraction was crucial in establishing the equivalence between lambda calculus and other models of computation#footnote[We will discuss the rest of the computation models later: *Turing machine* and *recursive function*.].

A landmark outcome in this line of research is the Church-Turing thesis, which posits that any function that is computably definable can be computed by a Turing machine, and vice versa. Although originally a hypothesis about the nature of computability, it has become a foundational principle in theoretical computer science. The lambda calculus, as one of the first formalizations of computability, played an essential role in shaping our modern understanding of algorithms and computational processes.

Over the subsequent decades, the study of lambda calculus expanded into various directions. It inspired the development of typed lambda calculi, such as the simply typed lambda calculus and the more expressive polymorphic lambda calculus (also known as System F), which introduced types as a means to impose additional structure and safety in programming languages. These developments have had a lasting impact on the design of modern programming languages, influencing both their syntax and type systems.

Moreover, lambda calculus has served as a bridge between pure mathematics and computer science. Its abstraction and elegance have allowed researchers to apply mathematical reasoning to the study of computation, leading to important results like the Church-Rosser theorem (which guarantees the confluence of reduction sequences, ensuring that the order of applying reduction rules does not affect the final outcome) and insights into the structure of formal proofs.

In summary, the history of lambda calculus is a story of cross-pollination between disciplines. What began as a tool for clarifying the notion of computability in the foundations of mathematics has grown into a central pillar of theoretical computer science, influencing the way we think about programming, language design, and the very nature of computation itself.

Nowadays, lambda calculus continues to be a vibrant area of research, with ongoing work in areas like higher-order logic, proof theory, and the semantics of programming languages. Its legacy lives on in the functional programming paradigms that have become increasingly popular in industry, as well as in the foundational principles that underpin the theory of computation. This note aims to provide a concise but comprehensive introduction to the key ideas and results in lambda calculus, with an eye towards both its historical development and its modern applications. In most modern programming languages, lambda calculus is used as a theoretical foundation for functional programming, for example, the lambda expression in Python, the lambda function in JavaScript, and the lambda function in C++, Java, and many other languages. 

Moreover, the lambda calculus is also used in the design of programming languages, such as Haskell, which is a purely functional programming language. Yet the most interesting fact is that, the notion of lambda calculus is utilized to design programming languages for formalized proof/verification/reasoning, such as #link("https://coq.inria.fr/about-coq")[Coq] and #link("https://lean-lang.org/about/")[lean]. We could also find the usage of lambda calculus in compilers, interpreters, and other tools for programming languages for varied purposes, such as static analysis, optimization, and verification, which are more advanced topics in theoretical computer science. In short, the lambda calculus is a fundamental concept in computer science, and it is widely used in various fields of computer science, as the intersection of mathematics and computer science.


=== Basic Ideas and Notations
Before delving into the formal definition of lambda calculus, let us introduce some basic ideas and notations that will be used throughout this note. As its name, lambda calculus revolves around the concept of functions, which are central to the system. 

==== Functions and Abstraction
In middle school, we leart functions from naive perspective of computation, or calculation.
#example[A simple function $f(x) = x^2 + 2x + 1$. Given an input value $x$, we can compute the output of the function by substituting $x$ into the formula: $f(3) = 3^2 + 2 times 3 + 1 = 9 + 6 + 1 = 16$. This is a typical example of a function in the context of arithmetic computation.]

While as we get involved in deeper topics, we were told that functions are not only about computation, but also about transformation, abstraction, and composition, which could be described by set theory, using the abstraction of mapping. In this perspective, we are particular about the domain(set of input values), codomain(set of output values), and the mapping rule. With this notion, we can construct a more abstract mapping, like a transformation from $RR^2 "to" RR^3$.
#example[
  Consider a function $f: RR^2 "to" RR^3$, defined by: $f mat(x; y) = mat(x; y; x^2+y^2)$.

  This function takes a point $(x, y)$ from the 2D plane and maps it to a point in 3D space. The first two coordinates remain unchanged, while the third coordinate represents the squared distance from the origin in $RR^2$. This can be seen as embedding the 2D Euclidean plane into a 3D space in a way that preserves spatial relationships but introduces an additional dimension for representing magnitude.
]

In this example, we see that functions can be used in a more abstract sense for certain purposes, and now, I will show a even more interesting example, to illustrate the notion of function in a more abstract way.

So far, we have seen functions as mappings that transform numbers, vectors, or even other functions. However, an essential concept in lambda calculus and functional programming is that functions themselves can be inputs and outputs of other functions. These are called higher-order functions.

#definition(name: "Higher-Order Function")[
  A function is said to be *higher-order* if it takes other functions as arguments or returns functions as results. This concept is central to lambda calculus and functional programming, where functions are treated as first-class entities that can be manipulated and passed around like any other data.
]
#example[
  Consider this case in mathematics, where we have a function $f(x) = x^2$ and another function $g(x) = 2x + 1$. We can define a higher-order function $h$ that takes two functions as arguments and returns their composition, such as $h(x) = f(g(x))$.
]

There's another example even more known by us, derivative and integral themselves, are functions that take functions as input and output functions. This is a typical example of higher-order functions in mathematics, sadly many people failed to realize this fact.

We can still bring the abstraction to the next level, as CS student, we know many structures are recursively defined, so as some functions.

#example[
  The factorial function is a classic example of a recursive function. It is defined as:
  $ f(n) = cases(
    1 "if" n = 0,
    n dot f(n - 1) "if" n > 0
  ) $

  This definition states that:
  - $f(0) = 1$ as the base case.
  - For any $n > 0$, the function calls itself with $n - 1$, multiplying $n$ by the result of $f(n-1)$.
]

This example illustrates how functions can be defined in terms of themselves, leading to recursive structures that capture repetitive patterns in computation.

In the broader context of Computer Science, functions are not limited to arithmetic operations or geometric transformations. They can be even more abstract, representing processes, behaviors, or even subjective experiences.
#remark[
  You may also have found that the recursively defined function is also a higher-order function, as it takes itself, a function as input.
]
#example[
  Now, consider a function that takes a person's name as input and returns their level of happiness after listening to a particular piece of music:

  $ H("Alice") = ? $

  Unlike the previous examples, there is no well-defined mathematical formula to express this function. The output depends on subjective factors such as personal taste, emotional state, and cultural background. We can describe $H$ in words: 

  "$H("name")$ returns a measure of happiness after listening to a given song, influenced by personal preferences and mood."

  This example illustrates that some functions exist conceptually but cannot be formulated explicitly. Instead, they rely on natural language descriptions, making them more abstract than typical mathematical functions.
]

For anyone with programming experience, the previous example should be familiar. In programming practice, programmers often define functions that encapsulate complex behaviors or processes, such as sorting a list, parsing a text file, or rendering a graphical user interface. These functions are not just mathematical abstractions but concrete implementations that interact with the real world through input and output.

==== Existential and Procedural View of Functions
The other prerequisite for understanding lambda calculus is to distinguish between the existential and procedural views of functions. This distinction is crucial for grasping the essence of computation and abstraction in lambda calculus. We can illustrate this difference by considering a known fact that $(a+b)^2=a^2+b^2+2a b$. Now we define $f(x)=(a+b)^2$, $g(x)=a^2+b^2+2a b$, can we say $f(x)=g(x)$? The answer is yes and no. Yes, because they are equal in terms of the value they return for each and every input $x$. No, because they are different in terms of the process they use to compute the value. 

The debate reveals the piecture of the existential and procedural views of functions. 
#definition(name: "Existential View of Functions")[
  The existential view treats functions as black boxes that map inputs to outputs, without revealing the internal mechanism. In this view, functions are defined by their behavior or properties, rather than by the steps they take to compute the result. In this case, two functions. $f(x)$ and $g(x)$ are considered equal if and only if they produce the same output for every input $x$. Formally, $ f(x) = g(x) arrow.l.r.double.long f(x) = g(x) $ for all $x$ in the domain of $f$ and $g$.
]
The existential view treats functions as black boxes that map inputs to outputs, without revealing the internal mechanism. In this view, functions are defined by their behavior or properties, rather than by the steps they take to compute the result.

The opposite view is the procedural view of functions, which focuses on the process or algorithm used to compute the output. 
#definition(name: "Procedural View of Functions")[
  The procedural view treats functions as algorithms or procedures that specify a sequence of steps to transform inputs into outputs. In this view, two functions are considered equal if they follow the same sequence of steps to produce the output. Formally, $ f(x) = g(x) arrow.l.r.double.long f(x) = g(x) $ for all $x$ in the domain of $f$ and $g$.
]

It should be told that in lambda calculus, we are more interested in the existential view of functions, as we are more interested in the behavior of functions, rather than the process of computation. This is a key distinction that sets lambda calculus apart from other models of computation, such as the Turing machine, which emphasizes the procedural view of computation.

=== Lambda Calculus and Computation
=== Other Computation Models
