/* 
* Formal specification and verification of a simple method for calculating 
* Fibonacci numbers applying dynamic programming.
* FEUP, MIEIC, MFES, 2019/20.
*/

// Initial specification, functional style, recursive (exponential time)
function fib(n : nat ) : nat {/* TODO */ }  by method
{
    var x, y := 0, 1; // fib(0), fib(1)
    for i := 0 to n 
      invariant x == fib(i) && y == fib(i+1)
    {/* TODO */ }
    return x;
}

// Statically checked (proved) test cases!  
method testFib()
{/* TODO */ }

