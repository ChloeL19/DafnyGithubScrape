// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class C {
class C {
  ghost var x:int;
  method f(ghost y:int) {}
  method f(ghost y:int) {}
  method test0() { f(x);}  // passes
  method test0() { f(x);}  // passes
  constructor(ghost y:int) {x:=y;}
  constructor(ghost y:int) {x:=y;}
  method test1() returns (c:C) { c := new C(x); } // used to fail with "ghost fields are allowed only in specification contexts"
  method test1() returns (c:C) { c := new C(x); } // used to fail with "ghost fields are allowed only in specification contexts"
}

