function abs(x: int): int
{
    if x < 0 then -x else x
}

method Testing_abs()
{
    var v := abs(3);
}


// Exercise 4. Write a function max that returns the larger of two given integer parameters. Write a test method using an assert that checks that your function is correct.

function max(a: int, b: int): int
{
    // Fill in an expression here.
    if a > b then a else b
}
method Testing_max() {
    // Add assertions to check max here.
}


// Exercise 6:

method Abs(x: int) returns (y: int)
{
    // Then change this body to also use abs.
    if x < 0 {
        return -x;
    } else {
        return x;
    }
}


// Ghost
ghost function Double(val:int) : int
{
    2 * val
}

method TestDouble(val: int) returns (val2:int)
{
    val2 := 2 * val;
}
