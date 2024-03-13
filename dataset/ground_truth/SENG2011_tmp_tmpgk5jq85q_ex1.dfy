predicate Acheck(a: array<int>, n:int) reads a
requires n != 0
{
    a.Length % 2 == 0 && forall i:nat :: 0 <= i < a.Length && (i % n == 0) ==> a[i] == 0
}
