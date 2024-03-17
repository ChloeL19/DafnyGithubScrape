// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This test checks for tricky cases of redundancy suppression when building
// triggers.

predicate P(x: int, y: int)
predicate Q(x: int)
predicate R(x: int)

method M() {
  // For this term, it is enough to order the terms by number of variables
}

predicate PP(x: int, y: int, z: int)
predicate QQ(x: int, y: int)
predicate RR(x: int, y: int)
predicate SS(x: int, y: int)

method MM() {
  // Not for this one, though
}

