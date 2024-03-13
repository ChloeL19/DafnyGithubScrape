method Partition(a: array<int>) returns (lo: int, hi: int)
{
  var i := 0;
  var j := a.Length;
  var k := a.Length;

  while i < j
    invariant 0 <= i <= j <= k <= a.Length
    invariant forall x | 0 <= x < i :: a[x] < 0
    invariant forall x | j <= x < k :: a[x] == 0
    invariant forall x | k <= x < a.Length :: a[x] > 0
  {
    if a[i] < 0 {
      i := i + 1;
    } else if a[i] == 0 {
      var current := a[i];
      a[i] := a[j-1];
      a[j-1] := current;
      j := j - 1;
    } else {
      assert a[i] > 0;
      var current := a[i];
      a[i] := a[j-1];
      a[j-1] := a[k-1];
      a[k-1] := current;
      j := j - 1;
      k := k - 1;
    }
  }

  return i, k;
}


