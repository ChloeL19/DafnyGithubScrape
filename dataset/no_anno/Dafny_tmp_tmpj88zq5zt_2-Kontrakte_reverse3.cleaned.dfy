method swap3(a: array<int>, h: int, i: int, j: int)
{
    var tmp := a[h];
    a[h] := a[i];
    a[i] := a[j];
    a[j] := tmp;
}

method testSwap3(a: array<int>, h: int, i: int, j:int )
{
  swap3(a, h, i, j);
  assert a[h] == old(a[i]);
  assert a[j] == old(a[h]);
  assert a[i] == old(a[j]);
  assert forall k: int :: 0 <= k < a.Length && k != h && k != i && k != j ==> a[k] == old(a[k]); 
}
