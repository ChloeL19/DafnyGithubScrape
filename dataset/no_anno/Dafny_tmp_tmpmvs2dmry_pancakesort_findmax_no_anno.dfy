// returns an index of the largest element of array 'a' in the range [0..n)
method findMax (a : array<int>, n : int) returns (r:int)
{
  var mi;
  var i;
  mi := 0;
  i := 0;
  while (i < n)
  {
    if (a[i] > a[mi])
    { 
      mi := i; 
    }
    i := i + 1;
  }
  return mi;
}

