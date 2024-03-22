// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file checks that function applications yield trigger candidates

method M(P: (int -> int) -> bool, g: int -> int)
  requires P.requires(g)
  requires P(g) {/* TODO */ }

