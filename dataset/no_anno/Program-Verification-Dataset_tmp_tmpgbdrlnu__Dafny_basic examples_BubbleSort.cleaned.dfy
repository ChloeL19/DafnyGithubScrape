predicate sorted(a:array<int>, from:int, to:int)
{
  forall u, v :: from <= u < v < to ==> a[u] <= a[v]
}

predicate pivot(a:array<int>, to:int, pvt:int)
{
  forall u, v :: 0 <= u < pvt < v < to ==> a[u] <= a[v]
}

method bubbleSort (a: array<int>)
{
  var i:nat := 1;

  while (i < a.Length)
    invariant i <= a.Length;
    invariant sorted(a, 0, i);
    invariant multiset(a[..]) == multiset(old(a[..]));
  {
    var j:nat := i;
    while (j > 0)
      invariant multiset(a[..]) == multiset(old(a[..]));
      invariant sorted(a, 0, j);
      invariant sorted(a, j, i+1);
      invariant pivot(a, i+1, j);
    {
      if (a[j-1] > a[j]) {
        var temp:int := a[j-1];
        a[j-1] := a[j];
        a[j] := temp;
      }
      j := j - 1;
    }
    i := i+1;
  }
}

