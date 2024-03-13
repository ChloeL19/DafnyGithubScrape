// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module M {
  inductive predicate P(x: int)
  {
    x < 100
  }

  copredicate Q(x: int)
  {
    x < 100
  }

  lemma K(x: int)
  {
  }
  lemma K'(x: int)
  {
  }
  lemma CoK(x: int)
  {
  }
  lemma CoK'(x: int)
  {
  }
}

module M' {
  import opened M

  lemma H(x: int)
  {
  }
  lemma H'(x: int)
  {
  }
  lemma CoH(x: int)
  {
  }
  lemma CoH'(x: int)
  {
  }

  lemma L(x: int)
  {
  }
  lemma L'(x: int)
  {
  }
  lemma CoL(x: int)
  {
  }
  lemma CoL'(x: int)
  {
  }

  inductive lemma V(x: int)
    requires P(x)
  {
  }
  inductive lemma W(x: int)
    requires M.P(x)
  {
  }
  colemma CoV(x: int)
    requires x < 100
    ensures Q(x)
  {
  }
  colemma CoW(x: int)
    requires x < 100
    ensures M.Q(x)
  {
  }
}

