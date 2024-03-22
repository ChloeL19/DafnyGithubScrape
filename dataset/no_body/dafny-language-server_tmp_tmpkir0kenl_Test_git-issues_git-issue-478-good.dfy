// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// By first defining import LibA and then defining a module LibA,
// the latter used to generate:
//     duplicate module name: LibA
// This now works, and the effect is to imported LibA opened and
// not introduce another local name for it.
import opened LibA
module LibA {
  method Hello() {/* TODO */ }
}

// By first defining module LibB and then defining import LibB,
// the latter used to generate:
//     can't import module LibB when not inside of a module
// This now works, and the effect is to imported LibB opened and
// not introduce another local name for it.
module LibB {
  method Hi() {/* TODO */ }
}
import opened LibB

module LibC {
  method Hey() {/* TODO */ }
}
import opened C = LibC

module LibD {
  method Tjena() {/* TODO */ }
}
import opened LibD = LibD  // name LibD explicitly

method Main() {/* TODO */ }

module Outer {
  module A {
    type T = int
  }
  module B {
    import opened A
    method P(u: A.T, v: T) returns (w: int) {/* TODO */ }
  }
}

