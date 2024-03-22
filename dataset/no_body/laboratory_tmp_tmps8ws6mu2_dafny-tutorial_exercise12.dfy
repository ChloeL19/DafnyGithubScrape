method FindMax(a: array<int>) returns (i: int)
    // Annotate this method with pre- and postconditions
    // that ensure it behaves as described.
    requires 0 < a.Length
    ensures 0 <= i < a.Length
    ensures forall k: int :: 0 <= k < a.Length ==> a[k] <= a[i]
{/* TODO */ }
