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
lemma Transitive(x: T, y: T, z: T)
function f(x: T): T
function g(x: T): T
lemma Connection(x: T, y: T)
lemma Monotonic(u: T, v: T)
{
  FMonotonic(u, v);
  GMonotonic(u, v);
}

lemma FMonotonic(u: T, v: T)
{
  calc {
    Below(f(u), f(v));
  ==  { Reflexive(f(v)); }
    Below(f(v), f(v)) ==> Below(f(u), f(v));
  ==  { Connection(v, f(v)); Connection(u, f(v)); }
    Below(v, g(f(v))) ==> Below(u, g(f(v)));
  <== { Transitive(u, v, g(f(v))); }
    Below(u, v);
  }
}

// Dijkstra justifies "GMonotonic" by symmetry, after introducing "Above", the dual of "Below".

predicate Above(x: T, y: T)
{
  Below(y, x)
}

lemma AboveReflexive(x: T)
{
  Reflexive(x);
}

lemma AboveTransitive(x: T, y: T, z: T)
{
  Transitive(z, y, x);
}

// To say that "GMonotonic" follows from "FMonotonic" and symmetry,
// we need a more parameterized version of "FMonotonic".  Here is one
// way of doing that. (Another way would be to use modules and refinement.)

lemma GeneralMonotonic(u: T, v: T, below: (T, T) -> bool, a: T -> T, b: T -> T)
{
  calc {
    below(a(u), a(v));
  ==  // reflexivity
    below(a(v), a(v)) ==> below(a(u), a(v));
  ==  // Galois connection
    below(v, b(a(v))) ==> below(u, b(a(v)));
  <== // transitivity
    below(u, v);
  }
}

// Before proving "GMonotonic", let's just show that "FMonotonic" is indeed an instance
// of "GeneralMonotonic" as well.

lemma FMonotonic'(u: T, v: T)
{
  // To call "GeneralMonotonic", we need to establish its precondition.  It holds on
  // behalf of the axioms above. The axioms were conveniently stated as holding for
  // given "x", "y", and "z", but here we need them explicitly universally quantified.
  // We apply this "universal introduction" rule by invoking the axioms for all
  // possible values, which is done using the "forall" statement.
  forall x {
    Reflexive(x);
  }
  forall x, y, z {
    Transitive(x, y, z);
  }
  forall x, y {
    Connection(x, y);
  }
  GeneralMonotonic(u, v, Below, f, g);
}

lemma GMonotonic(u: T, v: T)
{
  forall x {
    AboveReflexive(x);
  }
  forall x, y, z {
    AboveTransitive(x, y, z);
  }
  forall x, y {
    calc {
      Above(g(x), y);
    ==  // def. Above
      Below(y, g(x));
    ==  { Connection(y, x); }
      Below(f(y), x);
    ==  // def. Above
      Above(x, f(y));
    }
  }
  GeneralMonotonic(v, u, Above, g, f);
}

