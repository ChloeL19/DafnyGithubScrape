method FindMax(a: array<int>) returns (max: int)
{
  var i := 0;
  max := 0;

  while (i < a.Length)
  {
    if (a[i] > a[max]) { max := i; }
    i := i + 1;
  }
  return max;
}

