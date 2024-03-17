method sortArray(arr: array<int>) returns (arr_sorted: array<int>)
    // Requires array length to be between 0 and 10000
{
    var i := 0;
    while i < arr.Length
    {
        var j := i;
        while j < arr.Length
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

