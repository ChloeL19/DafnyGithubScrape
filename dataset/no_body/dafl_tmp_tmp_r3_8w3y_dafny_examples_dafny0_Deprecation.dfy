// RUN: %dafny /compile:3 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file contains tests for messags about various deprecated features.
// As those features go away completely, so can the corresponding tests.

method Main() {/* TODO */ }

// ----------

class C {
  constructor ()
    modifies this  // deprecation warning: "this" is no longer needed in modifies of a constructor
  {
  }
}

// ----------

inductive predicate InductivePredicate()  // deprecation warning: "inductive predicate" has been renamed to "least predicate"
{ true }

copredicate CoPredicate()  // deprecation warning: "copredicate" has been renamed to "greatest predicate"
{ true }

inductive lemma InductiveLemma()  // deprecation warning: "inductive lemma" has been renamed to "least lemma"
{/* TODO */ }

colemma CoLemma()  // deprecation warning: "colemma" has been renamed to "greatest lemma"
{ }


