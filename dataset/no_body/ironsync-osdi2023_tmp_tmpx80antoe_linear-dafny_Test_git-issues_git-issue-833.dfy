// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class C {
  ghost var x:int;
  method f(ghost y:int) {/* TODO */ }
  method test0() {/* TODO */ }  // passes
  constructor(ghost y:int) {x:=y;}
  method test1() returns (c:C) {/* TODO */ } // used to fail with "ghost fields are allowed only in specification contexts"
}

