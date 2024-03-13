method sortArray(arr: array<int>) returns (arr_sorted: array<int>)
{
    var i := 0;
    while i < arr.Length
        invariant i <= arr.Length
        invariant sorted(arr, 0, i)
        invariant multiset(old(arr[..])) == multiset(arr[..])
        invariant forall u, v :: 0 <= u < i && i <= v < arr.Length ==> arr[u] <= arr[v]
        invariant pivot(arr, i)
    {
        var j := i;
        while j < arr.Length
            invariant j <= arr.Length
            invariant multiset(old(arr[..])) == multiset(arr[..])
            invariant pivot(arr, i)
            invariant forall u :: i < u < j ==> arr[i] <= arr[u]
            invariant forall u :: 0 <= u < i ==> arr[u] <= arr[i]
            invariant sorted(arr, 0, i+1)
        {
            if arr[i] > arr[j]
            {
                var temp := arr[i];
                arr[i] := arr[j];
                arr[j] := temp;
            }
            j := j + 1;
        }
        i := i + 1;
    }
    return arr;
} 

// Predicate to determine whether the list is sorted between [start, stop)
predicate sorted(arr: array<int>, start: int, end: int)
{
    forall i, j :: start <= i <= j < end ==> arr[i] <= arr[j]
}

// Predicate to determine whether element arr[pivot] is a pivot point
// Based on: https://github.com/stqam/dafny/blob/master/BubbleSort.dfy
predicate pivot(arr: array<int>, pivot: int)
{
    forall u, v :: 0 <= u < pivot < v < arr.Length ==> arr[u] <= arr[v]
}

