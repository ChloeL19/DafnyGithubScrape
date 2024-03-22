//Problem01
//a)
method swap(a: array<int>, i: nat, j: nat)
    modifies a
    requires a != null && a.Length > 0 && i < a.Length && j < a.Length
    ensures a[i] == old(a[j])
    ensures a[j] == old(a[i])
{/* TODO */ }

//b)
//Problem04
method FindMin(a: array<int>, lo: nat) returns (minIdx: nat)
    requires a != null && a.Length > 0 && lo < a.Length
    ensures lo <= minIdx < a.Length
    ensures forall x :: lo <= x < a.Length ==> a[minIdx] <= a[x]
{/* TODO */ }

//Problem02
ghost predicate sorted(a:seq<int>)
{
    forall i | 0 < i < |a| :: a[i-1] <= a[i]     
}

method selectionSort(a: array<int>)
    modifies a
    //ensures multiset(a[..]) == multiset(old(a[..]))
    //ensures sorted(a[..])
{/* TODO */ }


//Problem03



