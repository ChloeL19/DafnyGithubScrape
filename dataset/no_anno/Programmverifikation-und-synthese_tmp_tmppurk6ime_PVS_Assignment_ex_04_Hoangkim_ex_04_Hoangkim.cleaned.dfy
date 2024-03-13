//Problem 01
method sumOdds(n: nat) returns (sum: nat)
{
    sum := 1;
    var i := 0;

    while i < n-1
        invariant 0 <= i < n;
        invariant sum == (i + 1) * (i + 1);
    {
        i := i + 1;
        sum := sum + 2 * i + 1;
    }

    assert sum == n * n;

}

//problem02
//a)
method intDiv(n:int, d:int) returns (q:int, r:int)
method intDivImpl(n:int, d:int) returns (q:int, r:int)
{
    q := 0;
    r := n;
    while r >= d
        invariant r == n - q * d;
        invariant d <= r;
        r := r-1;
    {
        r := r - d;
        q := q + 1;
    } 
    assert n == (d * q) + r;
}


