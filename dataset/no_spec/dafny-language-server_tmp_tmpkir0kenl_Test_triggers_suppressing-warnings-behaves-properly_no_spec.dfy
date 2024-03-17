// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file checks that suppressing warnings works properly

predicate f(x: int)
predicate g(x: int)

method M() {
}

