function sumTo( a:array<int>, n:int ) : int
  reads a;
{
  if (n == 0) then 0 else sumTo(a, n-1) + a[n-1]
}

method sum_array( a: array<int>) returns (sum: int)
{
  var i := 0;
  sum := 0;
  while (i < a.Length)
  {
    sum := sum + a[i];
    i := i + 1;
  }
}

