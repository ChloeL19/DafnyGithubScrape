// RUN: /print:log.bpl

method ArrayMap<A>(f: int -> A, a: array<A>)
{
  var i := 0;
  while i < a.Length
  {
    a[i] := f(i);
    i := i + 1;
  }
}


/*method GenericSort<A>(cmp: (A, A) -> bool, a: array<A>)
{

  var i := 0;

  while i < a.Length
    modifies a
  {
    var j := i - 1;
    while j >= 0 && !cmp(a[j], a[i])
      modifies a
    {
      a[i], a[j] := a[j], a[i];
      j := j - 1;
    }

    i := i + 1;
  }

}*/

