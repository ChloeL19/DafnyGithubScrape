method FindMax(a: array<int>) returns (i: int)
  // Annotate this method with pre- and postconditions
  // that ensure it behaves as described.
{
  // Fill in the body that calculates the INDEX of the maximum.
  i := 0;
  var index := 1;
  while index < a.Length
  {
    if a[index] > a[i] {i:= index;}
    index := index + 1;
  }
}

