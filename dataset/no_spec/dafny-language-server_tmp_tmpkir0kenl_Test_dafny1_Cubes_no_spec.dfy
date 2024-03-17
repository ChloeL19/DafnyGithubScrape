// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Cubes(a: array<int>)
{
  var n := 0;
  var c := 0;
  var k := 1;
  var m := 6;
  while n < a.Length
  {
    a[n] := c;
    c := c + k;
    k := k + m;
    m := m + 6;
    n := n + 1;
  }
}

