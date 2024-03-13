// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function f():nat
{                  // no problem for methods
  var x := 0;      // no problem without this
  assert true by {}
  0
}

