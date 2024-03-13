method cubes(a: array<nat>)
modifies a
{
    var c := 0;
    var n := 0;
    var k := 1;
    var l := 6;
    while (n < a.Length)
      invariant 0 <= n <= a.Length;
      invariant c == n*n*n;
      invariant k == 3*n*n +3*n + 1;
      invariant l == 6*n + 6;
    {
      a[n] := c;
      c := c + k;
      k := k + l;
      l := l + 6;
      n := n + 1;
    }
}

