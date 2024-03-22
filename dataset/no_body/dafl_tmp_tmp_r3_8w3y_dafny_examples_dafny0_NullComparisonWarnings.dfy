// RUN: %dafny /compile:3 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

class MyClass {
  var next: MyClass

  constructor () {
    next := this;
  }
}

method M(x: MyClass, c: MyClass, N: nat, S: set<MyClass>) {/* TODO */ }

class Cell<G> {
  var data: G
  constructor (g: G) {
    data := g;
  }
}

