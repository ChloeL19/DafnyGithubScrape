// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method NinetyOne(x: int, ghost proveFunctionalPostcondition: bool) returns (z: int)
{
  var y1 := x;
  var y2 := 1;
  while (true)
    // the following two invariants are needed only to prove the postcondition
  {
    if (y1 > 100) {
      if (y2 == 1) {
        break;
      } else {
        y1 := y1 - 10;
        y2 := y2 - 1;
      }
    } else {
      y1 := y1 + 11;
      y2 := y2 + 1;
    }
  }
  z := y1 - 10;
}

method Gcd(x1: int, x2: int)
{
  var y1 := x1;
  var y2 := x2;
  while (y1 != y2)
  {
    while (y1 > y2)
    {
      y1 := y1 - y2;
    }
    while (y2 > y1)
    {
      y2 := y2 - y1;
    }
  }
}

method Determinant(X: array2<int>, M: int) returns (z: int)
{
  var y := X[1-1,1-1];
  var a := 1;
  while (a != M)
  {
    var b := a + 1;
    while (b != M+1)
    {
      var c := M;
      while (c != a)
      {
        assume X[a-1,a-1] != 0;
        X[b-1, c-1] := X[b-1,c-1] - X[b-1,a-1] / X[a-1,a-1] * X[a-1,c-1];
        c := c - 1;
      }
      b := b + 1;
    }
    a := a + 1;
    y := y * X[a-1,a-1];
  }
  z := y;
}

