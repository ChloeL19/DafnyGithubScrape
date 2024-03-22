method Abs(x: int) returns (y: int)
    // Add a precondition here so that the method verifies.
    // Don't change the postconditions.
    requires x == -1
    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
{
    y:= x + 2;
}
method Abs2(x: int) returns (y: int)
    // Add a precondition here so that the method verifies.
    // Don't change the postconditions.
    requires 2 * x == -1
    ensures 0 <= y
    ensures 0 <= x ==> y == x
    ensures x < 0 ==> y == -x
{
    y:= x + 1;
}

