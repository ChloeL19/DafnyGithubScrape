method mergeSort(a: array<int>)
modifies a
{
  sorting(a, 0, a.Length-1);
}

method merging(a: array<int>, low: int, medium: int, high: int)
{
  var x := 0;
  var y := 0;
  var z := 0;
  var a1: array<int> := new [medium - low + 1];
  var a2: array<int> := new [high - medium];
  // The first case
  while(y < a1.Length && low+y < a.Length)
  {
    a1[y] := a[low+y];
    y := y +1;
  }
  // The second case
  while(z < a2.Length && medium+z+1 < a.Length)
  {
    a2[z] := a[medium+z+1];
    z := z +1;
  }
  y, z := 0, 0;
  // The third case
  while (x < high - low + 1 && y <= a1.Length && z <= a2.Length && low+x < a.Length)
  {
    if(y >= a1.Length && z >= a2.Length) {
      break;
    } else if(y >= a1.Length) {
      a[low+x] := a2[z];
      z := z+1;
    } else if(z >= a2.Length) {
      a[low+x] := a1[y];
      y := y+1;
    } else {
      if(a1[y] <= a2[z]) {
        a[low+x] := a1[y];
        y := y +1;
      } else {
        a[low+x] := a2[z];
        z := z +1;
      }
    }
    x := x+1;
  }
}

method sorting(a: array<int>, low: int, high: int)
{
    if (low < high) {
        var medium: int := low + (high - low)/2;
        sorting(a, low, medium);
        sorting(a, medium+1, high);
        merging(a, low, medium, high);
    }
}
