method Collatz(x: nat)
{
    var n := x;
    while 1 < n
    {
        n := if n % 2 == 0 then n / 2 else n * 3 + 1;
    }
}

