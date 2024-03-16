predicate sorted_between (a:array<int>, from:nat, to:nat)
  reads a;
{
  forall i,j :: from <= i < j < to && 0 <= i < j < a.Length ==> a[i] <= a[j]
}
  
predicate sorted (a:array<int>)
  reads a;
{
  sorted_between (a, 0, a.Length)
}

method bubbleSort (a: array<int>)
{
  var i:nat := 1;

  while (i < a.Length)
  {
    var j:nat := i;
    while (j > 0)
    {
      if (a[j-1] > a[j]) {
        var temp:int := a[j-1];
        // Introduced bug for permutation
        a[j-1] := a[j];
        //a[j-1] := a[j-1];
        a[j] := temp;
      }
      j := j - 1;
    }
    i := i+1;
  }
}

