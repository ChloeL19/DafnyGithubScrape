method cubes(a: array<nat>)
{
    var c := 0;
    var n := 0;
    var k := 1;
    var l := 6;
    while (n < a.Length)
    {
      a[n] := c;
      c := c + k;
      k := k + l;
      l := l + 6;
      n := n + 1;
    }
}

