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
  {
  }
  inductive lemma W(x: int)
  {
  }
  colemma CoV(x: int)
  {
  }
  colemma CoW(x: int)
  {
  }
}

