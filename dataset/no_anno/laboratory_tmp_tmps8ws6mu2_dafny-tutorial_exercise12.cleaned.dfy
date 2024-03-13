method FindMax(a: array<int>) returns (i: int)
{
    // Fill in the body that calculates the INDEX of the maximum.
    var j := 0;
    var max := a[0];
        i := 1;
    while i < a.Length
        invariant 1 <= i <= a.Length
        invariant forall k: int :: 0 <= k < i ==> max >= a[k]
        invariant 0 <= j < a.Length
        invariant a[j] == max
        decreases a.Length - i
    {
        if max < a[i] {
            max := a[i];
            j := i;
        }
        i := i + 1;
    }

    i := j;
}
