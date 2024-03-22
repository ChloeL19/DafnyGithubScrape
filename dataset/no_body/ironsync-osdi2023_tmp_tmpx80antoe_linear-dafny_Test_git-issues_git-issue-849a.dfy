// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module B {
  datatype Test = Test(v: nat, w: nat)
  method m(oldTest: Test) {/* TODO */ }
}

