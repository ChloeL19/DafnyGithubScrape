method findMax(a:array<int>) returns (pos:int, maxVal: int)
{
  pos := 0;
  maxVal := a[0];
  var j := 1;
  while(j < a.Length)
  {
    if (a[j] > maxVal) 
    {
      maxVal := a[j];
      pos := j;
    }
    j := j+1;
  }
  return;
}
