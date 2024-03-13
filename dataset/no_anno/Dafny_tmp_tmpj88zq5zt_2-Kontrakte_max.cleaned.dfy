method max(a: array<int>, b: array<int>, i: int, j: int)
{
  if a[i] > b[j] {
    m := a[i];
  } else  {
    m := b[j];
  }
}

method testMax(a:array<int>, b:array<int>, i: int, j: int)
{
  var max := max(a,b,i,j);
  assert a[i] > b[j] ==> max == a[i];
  assert a[i] <= b[j] ==> max == b[j];
}
