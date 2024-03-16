method binarySearch(a:array<int>, val:int) returns (pos:int)
{
  var left := 0;
  var right := a.Length;
  if a[left] > val || a[right-1] < val 
  {
    return -1;
  }
  while left < right
 
  {
    var med := (left + right) / 2;
    {
      left := med + 1;
    }
    else if a[med] > val
    {
      right := med;
    }
    else
    {
      pos := med;
      return;
    }

  }
  return -1;
}
