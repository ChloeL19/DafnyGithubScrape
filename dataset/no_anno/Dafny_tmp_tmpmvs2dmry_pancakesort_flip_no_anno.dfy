// flips (i.e., reverses) array elements in the range [0..num]
method flip (a: array<int>, num: int)
{
  var tmp:int;
  var i := 0;
  var j := num;
  while (i < j)
  {
    tmp := a[i];
    a[i] := a[j];
    a[j] := tmp;
    i := i + 1;
    j := j - 1;
  }
}

