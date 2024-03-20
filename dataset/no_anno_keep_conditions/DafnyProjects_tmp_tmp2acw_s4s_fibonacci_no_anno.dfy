/* 
* Formal specification and verification of a simple method for calculating 
* Fibonacci numbers applying dynamic programming.
* FEUP, MIEIC, MFES, 2019/20.
*/

// Initial specification, functional style, recursive (exponential time)
function fib(n : nat ) : nat {
    if n < 2 then n else fib(n - 2) + fib(n - 1)
}  by method
{
    var x, y := 0, 1; // fib(0), fib(1)
    for i := 0 to n 
    {
        x, y := y, x + y; // simultaneous assignment
    }
    return x;
}

// Statically checked (proved) test cases!  
method testFib()
{
}

