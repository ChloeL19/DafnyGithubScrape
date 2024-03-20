method non_overlapping_intervals(intervals: array2<int>) returns (count: int)
    modifies intervals
{
    var row := intervals.Length0;
    if (row == 0)
    {
        return 0;
    }

    bubble_sort(intervals);
    
    var i := 1;
    count := 1;
    var end := intervals[0, 1];
    while (i < row)
    {
        if (intervals[i, 0] >= end)
        {
            count := count + 1;
            end := intervals[i, 1];
        }

        i := i + 1;
    }

    return row - count;
}


// Bubble Sort
method bubble_sort(a: array2<int>)
    modifies a
{
    var i := a.Length0 - 1;
    while (i > 0)
    {
        var j := 0;
        while (j < i)
        {
            if (a[j, 1] > a[j + 1, 1])
            {
                a[j, 1], a[j + 1, 1] := a[j + 1, 1], a[j, 1];
            }
            j := j + 1;
        }
        i := i -1;
    }
}


// Predicates for Bubble Sort
predicate sorted(a: array2<int>, l: int, u: int)
    reads a
{
    forall i, j :: 0 <= l <= i <= j <= u < a.Length0 ==> a[i, 1] <= a[j, 1]
}

predicate partitioned(a: array2<int>, i: int)
    reads a
{
    forall k, k' :: 0 <= k <= i < k' < a.Length0 ==> a[k, 1] <= a[k', 1]
}

