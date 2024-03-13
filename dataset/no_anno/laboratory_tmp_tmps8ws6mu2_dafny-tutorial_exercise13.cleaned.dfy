predicate sorted(a: array<int>)
{
    // Fill in a new body here.
    forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
}
