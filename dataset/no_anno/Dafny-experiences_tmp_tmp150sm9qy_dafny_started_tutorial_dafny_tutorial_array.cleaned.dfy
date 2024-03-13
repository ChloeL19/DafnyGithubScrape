method FindMax(a: array<int>) returns (i: int)
{
  // Fill in the body that calculates the INDEX of the maximum.
  i := 0;
  var index := 1;
  while index < a.Length
    invariant 0 < index <= a.Length
    invariant 0 <= i < index
    invariant forall k :: 0 <= k < index ==> a[k] <= a[i]
  {
    if a[index] > a[i] {i:= index;}
    index := index + 1;
  }
}

