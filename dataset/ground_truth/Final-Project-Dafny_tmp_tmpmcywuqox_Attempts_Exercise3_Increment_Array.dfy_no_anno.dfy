method incrementArray(a:array<int>)
{
  var j : int := 0;
  while(j < a.Length)
  {
    a[j] := a[j] + 1;
    j := j+1;   
  }
}
