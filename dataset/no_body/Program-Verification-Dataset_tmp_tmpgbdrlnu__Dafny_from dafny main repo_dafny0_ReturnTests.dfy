// RUN: %dafny /compile:0 /deprecation:0 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class N
{
   var i: int;
   method newN(n: N)
      modifies this, n;
   {/* TODO */ }
   method safe(n: N)
      modifies this;
   {/* TODO */ }
}

method m(v: int, n: N) returns (r: int)
   modifies n;
   ensures r == v;
{/* TODO */ }

method testing1() returns (a: int, b: set<int>)
{/* TODO */ }
method testing2() returns (a: int, b: int)
   ensures a == 1 && b == 2;
{/* TODO */ }
method testing3() returns (a: int, b: int)
   ensures a == 1 && b == 2;
{/* TODO */ }

method testing4(nnn: N) returns (n: N)
{/* TODO */ }

method testing5() returns (r: int)
   ensures r == 2;
{/* TODO */ }

iterator yieldTesting() yields (a: int, b: int)
   yield ensures a == 1 && b == 2;
{
   a, b := 2, 1; // these are wrong
   if (true)
   {
      var a, b := 3, 4;
      yield 1, 2;// return updates non-shadowed, formal parameters correctly
   }
}

