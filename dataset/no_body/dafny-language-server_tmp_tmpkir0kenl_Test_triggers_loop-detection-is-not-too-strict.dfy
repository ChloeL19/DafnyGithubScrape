// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This test shows that the loop detection engine makes compromises when looking
// for subexpressions matching a trigger; in particular, it allows a
// subexpression to match a trigger without reporting a loop and without being
// equal to that trigger, as long as the only differences are variable

predicate P(x: int, y: int)
predicate Q(x: int)

method Test(z: int) {/* TODO */ }

