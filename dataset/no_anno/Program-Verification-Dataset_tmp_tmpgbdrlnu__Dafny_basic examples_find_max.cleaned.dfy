method FindMax(a: array<int>) returns (max: int)
{
  var i := 0;
  max := 0;

  while (i < a.Length)
    invariant i <= a.Length;
    invariant 0 <= max;
    invariant max == 0 || 0 < max < i;
    invariant forall k :: 0 <= k < i ==> a[max] >= a[k]
  {
    if (a[i] > a[max]) { max := i; }
    i := i + 1;
  }
  return max;
}

