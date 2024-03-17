// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file checks that function applications yield trigger candidates

method M(P: (int -> int) -> bool, g: int -> int)
  assume forall f: int -> int :: P.requires(f);
  assume forall f: int -> int :: P(f) ==> f.requires(10) && f(10) == 0;
    f(10) == 0;
}

