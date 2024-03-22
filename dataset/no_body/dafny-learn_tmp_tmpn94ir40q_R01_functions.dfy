function abs(x: int): int
{
    if x < 0 then -x else x
}

method Testing_abs()
{/* TODO */ }


// Exercise 4. Write a function max that returns the larger of two given integer parameters. Write a test method using an assert that checks that your function is correct.

function max(a: int, b: int): int
{/* TODO */ }
method Testing_max() {/* TODO */ }


// Exercise 6:

method Abs(x: int) returns (y: int)
    ensures abs(x) == y
{/* TODO */ }


// Ghost
ghost function Double(val:int) : int
{
    2 * val
}

method TestDouble(val: int) returns (val2:int)
    ensures val2 == Double(val)
{/* TODO */ }
