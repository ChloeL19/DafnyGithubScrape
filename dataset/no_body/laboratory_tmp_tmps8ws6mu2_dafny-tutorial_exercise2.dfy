method Abs(x: int) returns (y: int)
    // Add a precondition here.
    requires x < 0
    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
    {/* TODO */ }

