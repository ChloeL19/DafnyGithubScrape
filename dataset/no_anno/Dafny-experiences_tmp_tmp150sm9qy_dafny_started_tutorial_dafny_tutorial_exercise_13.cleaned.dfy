predicate sorted(a: array<int>) // Change the type
{
  // Change this definition to treat null arrays as "not sorted".
  // (i.e. return false for null arrays)
  if a.Length == 0 then false else forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}
