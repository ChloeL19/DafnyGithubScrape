predicate SplitPoint(a: array<int>, n: int)
    reads a
    requires 0 <= n <= n

{
    forall i,j :: 0 <= i < n <= j < a.Length ==> a[i] <= a[j]
}

method SelectionSort(a: array<int>)
    modifies a
    ensures forall i,j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
    ensures multiset(a[..]) == old(multiset(a[..]))
{/* TODO */ }

method QuickSort(a: array<int>)
    modifies a
    ensures forall i,j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
    ensures multiset(a[..]) == old(multiset(a[..]))
{/* TODO */ }

twostate predicate SwapFrame(a: array<int>, lo: int, hi: int)
    requires 0 <= lo <= hi <= a.Length
    reads a
{
    (forall i :: 0 <= i < lo || hi <= i < a.Length ==> a[i] == old(a[i])) && multiset(a[..]) == old(multiset(a[..]))
}

method QuickSortAux(a: array<int>, lo: int, hi: int)
    requires 0 <= lo <= hi <= a.Length
    requires SplitPoint(a, lo) && SplitPoint(a, hi)
    modifies a
    ensures forall i,j :: lo <= i < j < hi ==> a[i] <= a[j]
    ensures SwapFrame(a, lo, hi)
    ensures SplitPoint(a, lo) && SplitPoint(a, hi)
    decreases hi - lo
{/* TODO */ }

method Partition(a: array<int>, lo: int, hi: int) returns (p: int)
    requires 0 <= lo < hi <= a.Length
    requires SplitPoint(a, lo) && SplitPoint(a, hi)
    modifies a
    ensures lo <= p < hi
    ensures forall i :: lo <= i < p ==> a[i] < a[p]
    ensures forall i :: p <= i < hi ==> a[p] <= a[i]
    ensures SplitPoint(a, lo) && SplitPoint(a, hi)
    ensures SwapFrame(a, lo, hi)
{/* TODO */ }
