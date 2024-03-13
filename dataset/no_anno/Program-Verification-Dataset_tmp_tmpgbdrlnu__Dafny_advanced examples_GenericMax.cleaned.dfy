method GenericMax<A>(cmp: (A, A) -> bool, a: array<A>) returns (max: A)
{
  max := a[0];
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: 0 <= x < i ==> cmp(a[x], max)
  {
    if !cmp(a[i], max) {
      max := a[i];
    }
    i := i + 1;
  }
}

