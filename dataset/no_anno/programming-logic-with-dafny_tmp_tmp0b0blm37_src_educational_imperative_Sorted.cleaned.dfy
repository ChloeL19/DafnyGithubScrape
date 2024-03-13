
predicate sorted_between(A:array<int>, from:int, to:int)
{
    forall i, j :: 0 <= i <= j < A.Length && from <= i <= j <= to ==> A[i] <= A[j]
}

predicate sorted(A:array<int>)
{
    sorted_between(A, 0, A.Length-1)
}

