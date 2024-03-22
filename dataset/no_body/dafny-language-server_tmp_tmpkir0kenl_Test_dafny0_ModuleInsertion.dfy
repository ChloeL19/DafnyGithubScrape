// RUN: %dafny /env:0 /dprint:- /dafnyVerify:0 "%s" > "%t"
// RUN: %dafny /env:0 /rprint:- /compile:3 "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

// ----- Outer

module Outer {
  module C {
    import D
    const c := 2 + D.d
  }
  method Test() {/* TODO */ }
}

module Outer.A {
  import B
  import C
  const a := B.b + C.c
}

module Outer.B {
  const b := 1
}

module Outer.D {
  const d := 3
}

// ----- Oreo

module XY.X {
  const m := 20
  module M {
    import Y
    const n := Y.m - 5
  }
}

module XY {
  method Test() {/* TODO */ }
}

module XY.Y {
  const m := 22
}

// ----- Triple

module U.V.W.X {
  const x0 := 12
}

module U.V {
  const x2 := 14 + W.x1 + W.X.x0
  method Test() {/* TODO */ }
}

module U.V.W {
  const x1 := 12 * X.x0
}

// ----- Prefix-named modules in user-defined module

module MyModule {
  module Q.W.E.R.T {
  }
  module Q.W.E.R.T.Y {
    const h := 2;
  }
}

