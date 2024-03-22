// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// Rustan Leino, 17 Jan 2018.
// A transcription of a little proof calculation by E.W. Dijkstra, see:
// http://www.cs.utexas.edu/users/EWD/ewd10xx/EWD1062.PDF

// Let "Below" be a reflexive, transitive relation over some type T.
// These properties are introduced as axioms, that is, as lemmas without
// proofs.

type T

predicate Below(x: T, y: T)

lemma Reflexive(x: T)
  ensures Below(x, x)

lemma Transitive(x: T, y: T, z: T)
  ensures Below(x, y) && Below(y, z) ==> Below(x, z)

// Let "f" and "g" be functions satisfying the Galois connection:

function f(x: T): T
function g(x: T): T

lemma Connection(x: T, y: T)
  ensures Below(f(x), y) == Below(x, g(y))

// From the above, prove that "f" and "g" are monotonic with respect to "Below".

lemma Monotonic(u: T, v: T)
  requires Below(u, v)
  ensures Below(f(u), f(v)) && Below(g(u), g(v))
{/* TODO */ }

lemma FMonotonic(u: T, v: T)
  requires Below(u, v)
  ensures Below(f(u), f(v))
{/* TODO */ }

// Dijkstra justifies "GMonotonic" by symmetry, after introducing "Above", the dual of "Below".

predicate Above(x: T, y: T)
{
  Below(y, x)
}

lemma AboveReflexive(x: T)
  ensures Above(x, x)
{/* TODO */ }

lemma AboveTransitive(x: T, y: T, z: T)
  ensures Above(x, y) && Above(y, z) ==> Above(x, z)
{/* TODO */ }

// To say that "GMonotonic" follows from "FMonotonic" and symmetry,
// we need a more parameterized version of "FMonotonic".  Here is one
// way of doing that. (Another way would be to use modules and refinement.)

lemma GeneralMonotonic(u: T, v: T, below: (T, T) -> bool, a: T -> T, b: T -> T)
  requires forall x :: below(x, x)  // "below" is reflexive
  requires forall x, y, z :: below(x, y) && below(y, z) ==> below(x, z)  // "below" is transitive
  requires forall x, y :: below(a(x), y) == below(x, b(y))  // Galois connection
  requires below(u, v)
  ensures below(a(u), a(v))
{/* TODO */ }

// Before proving "GMonotonic", let's just show that "FMonotonic" is indeed an instance
// of "GeneralMonotonic" as well.

lemma FMonotonic'(u: T, v: T)
  requires Below(u, v)
  ensures Below(f(u), f(v))
{/* TODO */ }

lemma GMonotonic(u: T, v: T)
  requires Below(u, v)
  ensures Below(g(u), g(v))
{/* TODO */ }

