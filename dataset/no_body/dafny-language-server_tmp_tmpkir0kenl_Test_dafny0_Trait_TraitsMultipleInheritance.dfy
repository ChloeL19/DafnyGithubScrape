// RUN: %dafny /compile:3 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

trait J1{
  var x: int;
}

trait J2{
  var y: int;
}

class C extends J1, J2{
}

method Main()
{/* TODO */ }
