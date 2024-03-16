method SelectionSort(a: array<int>)
{
  var n := 0;
  while n != a.Length
  {
    var mindex, m := n, n;
    while m != a.Length
    {
      if a[m] < a[mindex] {
        mindex := m;
      }
      m := m + 1;
    }
    if a[mindex] < a[n] {
      a[mindex], a[n] := a[n], a[mindex];
    }
    n := n + 1;
  }  
}
