type T = int // for demo purposes, but could be another type
predicate sorted(a: array<T>, n: nat) 
    requires n <= a.Length
    reads a
{
    forall i,j :: 0 <= i < j < n ==> a[i] <= a[j]
}

// Use binary search to find an appropriate position to insert a value 'x'
// in a sorted array 'a', so that it remains sorted.
method binarySearch(a: array<T>, x: T) returns (index: int) 
    requires sorted(a, a.Length)
    ensures sorted(a, a.Length)
    //ensures a[..] == old(a)[..]
    ensures 0 <= index <= a.Length
    //ensures forall i :: 0 <= i < index ==> a[i] <= x
    //ensures forall i :: index <= i < a.Length ==> a[i] >= x

    ensures index > 0 ==> a[index-1] <= x
    ensures index < a.Length ==> a[index] >= x
{/* TODO */ }

// Simple test cases to check the post-condition
method testBinarySearch() {/* TODO */ }

