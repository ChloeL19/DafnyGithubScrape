// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Ref<A> {
  var val : A
  constructor (a : A)
    ensures val == a
  {
    val := a;
  }
}

method Main() {/* TODO */ }


