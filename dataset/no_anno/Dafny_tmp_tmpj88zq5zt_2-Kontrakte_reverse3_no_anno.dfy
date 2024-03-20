method swap3(a: array<int>, h: int, i: int, j: int)
  modifies a
{
    var tmp := a[h];
    a[h] := a[i];
    a[i] := a[j];
    a[j] := tmp;
}

method testSwap3(a: array<int>, h: int, i: int, j:int )
  modifies a
{
  swap3(a, h, i, j);
}
