// RUN: %dafny /compile:3 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

trait J
{
  var x: int;
}

class C extends J
{

}

method Main()
{/* TODO */ }

method Print(j: J)
{/* TODO */ }

