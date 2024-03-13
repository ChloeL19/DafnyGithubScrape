method m ()
{
    var i := 20;
    while 0 < i
        invariant 0 <= i
        decreases i
    {
        i := i - 1;
    }
}

method m2()
{
    var i, n := 0, 20;
    while i < n
        invariant 0 <= i <= n
        decreases n - i
    {
        i := i + 1;
    }
}

// Exercise 11. In the loop above, the invariant i <= n and 
// the negation of the loop guard allow us to conclude i == n 
// after the loop (as we checked previously with an assert. 
// Note that if the loop guard were instead written as i != n 
// (as in Exercise 8), then the negation of the guard immediately 
// gives i == n after the loop, regardless of the loop invariant. 
// Change the loop guard to i != n and delete the invariant 
// annotation. Does the program verify? What happened?

method m3()
{
    var i, n := 0, 20;
    while i != n
        invariant (n - i) >= 0      // answer: add this
        decreases n - i
    {
        i := i + 1;
    }
}


function fib(n: nat): nat
    decreases n
{
    if n == 0 then 0
    else if n == 1 then 1
    else fib(n - 1) + fib(n - 2)
}
