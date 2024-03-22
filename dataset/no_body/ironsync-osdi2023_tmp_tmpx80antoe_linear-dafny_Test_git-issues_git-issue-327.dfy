// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module A {
  module AA {
    module AAA {
      const aaa := 50
    }
  }
  const a := 51
}

module B {
  import A
}

module C0 {}

module C refines C0 {
  import B
}

module CC refines C {}

module D refines CC {
  import A = B.A
}

module E {
  import S = A.AA
}

module F {
  import DD = D.A
  method m() {/* TODO */ }
}

module G {
  module H {
    module Z {
      const z := 52
    }
  }

  module I {
    module J {
      import E.S.AAA
      import HH = H.Z
      import D.A
      import D.A.AA
      import F
      method m0() {/* TODO */ }
      method m1() {/* TODO */ }
      method m2() {/* TODO */ }
      method m3() {/* TODO */ }
    }
    module K {
    }
  }
}

