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
    requires P(x)
  {/* TODO */ }
  lemma K'(x: int)
    requires P#[3](x)
  {/* TODO */ }
  lemma CoK(x: int)
    requires x < 100
    ensures Q(x)
  {/* TODO */ }
  lemma CoK'(x: int)
    requires x < 100
    ensures Q#[3](x)
  {/* TODO */ }
}

module M' {
  import opened M

  lemma H(x: int)
    requires M.P(x)
  {/* TODO */ }
  lemma H'(x: int)
     requires M.P#[3](x)
  {/* TODO */ }
  lemma CoH(x: int)
    requires x < 100
    ensures M.Q(x)
  {/* TODO */ }
  lemma CoH'(x: int)
    requires x < 100
    ensures M.Q#[3](x)
  {/* TODO */ }

  lemma L(x: int)
    requires P(x)
  {/* TODO */ }
  lemma L'(x: int)
    requires P#[3](x)
  {/* TODO */ }
  lemma CoL(x: int)
    requires x < 100
    ensures Q(x)
  {/* TODO */ }
  lemma CoL'(x: int)
    requires x < 100
    ensures Q#[3](x)
  {/* TODO */ }

  inductive lemma V(x: int)
    requires P(x)
  {/* TODO */ }
  inductive lemma W(x: int)
    requires M.P(x)
  {/* TODO */ }
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

