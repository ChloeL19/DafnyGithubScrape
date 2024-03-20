/**
  Inverts an array of ints.
 */
method InvertArray(a: array<int>)
  modifies a
{
  var index := 0;

  while index < a.Length / 2
  {
    a[index], a[a.Length - 1 - index] := a[a.Length - 1 - index], a[index];
    index := index + 1;
  }
}
