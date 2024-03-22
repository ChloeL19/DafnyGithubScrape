// RUN: %dafny /compile:3 /print:"%t.print" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Ref<A(0)> {
  var val: A
}

method Nice(n: int) returns (k: int) {/* TODO */ }

method OneShot(n: int) returns (k: int) {/* TODO */ }

method HeapQuant(n: int) returns (k: int) {/* TODO */ }

method Main() {/* TODO */ }

