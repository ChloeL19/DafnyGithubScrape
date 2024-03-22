// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module A {
  module Inner {
    export P reveals a,c
    export Q reveals b,c
    const a := 10
    const b := 20
    const c := 30
  }
}

module X {
  import I = A.Inner`P
  method m() {/* TODO */ }
}

module Y {
  import I = A.Inner`{P,Q}
  method m() {/* TODO */ }
}


