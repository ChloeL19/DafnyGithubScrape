// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module A {
  predicate F(x: int) { true }
  predicate F(x: int) { true }
}

module B {
  import I = A

  lemma Test(x: int)
  {
  }

  lemma TestWrapper()
  {
    forall x {
      Test(x);
    }
  }
}

