method GenericMax<A>(cmp: (A, A) -> bool, a: array<A>) returns (max: A)
    // assume cmp.requires(a[x], max);
    cmp(a[x], max)
{
  max := a[0];
  var i := 0;
  while i < a.Length
  {
    if !cmp(a[i], max) {
      max := a[i];
    }
    i := i + 1;
  }
}

