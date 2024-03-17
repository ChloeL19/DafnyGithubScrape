function fib(n: nat): nat
{
    if n == 0 then 0 else
    if n == 1 then 1 else
                    fib(n - 1) + fib(n - 2)
}

method ComputeFib(n: nat) returns (b: nat)
{
    // Change the method body to instead use c as described.
    // You will need to change both the initialization and the loop.
    var i: int := 0;
        b := 0;
    var c := 1;
    while i < n
    {
        b, c := c, c + b;
        i := i + 1;
    }
}
