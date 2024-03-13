method BinarySearch(a: array<int>, key: int) returns (n: int)
{
    var lo, hi := 0, a.Length;

    while lo < hi
        invariant 0 <= lo <= hi <= a.Length
        invariant forall i :: 0 <= i < lo ==> a[i] < key
        invariant forall i :: hi <= i < a.Length ==> key <= a[i]
    {
        var mid := (lo + hi) / 2;

        if a[mid] < key {
            lo := mid + 1;
        } else {
            hi := mid;
        }
    }

    n := lo;
}

