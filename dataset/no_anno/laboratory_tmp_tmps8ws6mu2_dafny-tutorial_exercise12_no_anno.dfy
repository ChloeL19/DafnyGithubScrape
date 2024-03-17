method FindMax(a: array<int>) returns (i: int)
    // Annotate this method with pre- and postconditions
    // that ensure it behaves as described.
{
    // Fill in the body that calculates the INDEX of the maximum.
    var j := 0;
    var max := a[0];
        i := 1;
    while i < a.Length
    {
        if max < a[i] {
            max := a[i];
            j := i;
        }
        i := i + 1;
    }

    i := j;
}
