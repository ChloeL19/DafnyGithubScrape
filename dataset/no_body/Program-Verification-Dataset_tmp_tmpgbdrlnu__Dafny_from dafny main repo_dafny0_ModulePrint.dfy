// NONUNIFORM: Tests printing much more than compilation
// RUN: %dafny /dafnyVerify:0 /compile:0 /env:0 /dprint:"%t.dfy" "%s" > "%t"
// RUN: %dafny /dafnyVerify:0 /compile:0 /env:0 /printMode:DllEmbed /dprint:"%t1.dfy" "%t.dfy" >> "%t"
// RUN: %dafny /env:0 /compile:3 /printMode:DllEmbed /dprint:"%t2.dfy" "%t1.dfy" >> "%t"
// RUN: %diff "%t1.dfy" "%t2.dfy" >> "%t"
// RUN: %diff "%s.expect" "%t"

abstract module S {
  class C {
    var f: int
    ghost var g: int
    var h: int
    method m()
      modifies this
  }
}

module T refines S {/* TODO */ }

method Main() {/* TODO */ }

