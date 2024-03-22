// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class A {
  var a: array<array<int>>
  constructor(b: array<array<int>>) {
    var c := b;
    a := b;
  }
}
method sub(a: array<array<int>>)
  requires a.Length > 0
  requires a[0].Length > 0
{/* TODO */ }
method Main() {/* TODO */ }

method MoreTests() {/* TODO */ }

method TestA() {/* TODO */ }

method TestB() {/* TODO */ }

method TestC() {/* TODO */ }

method TestD() {/* TODO */ }

method TestE() {/* TODO */ }

