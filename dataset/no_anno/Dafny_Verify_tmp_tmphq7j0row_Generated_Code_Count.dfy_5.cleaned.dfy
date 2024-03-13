function has_count(v: int, a: array<int>, n: int): int
{
    if n == 0 then 0 else
    (if a[n-1] == v then has_count(v, a, n-1) + 1 else has_count(v, a, n-1))
}


method count (v: int, a: array<int>, n: int) returns (r: int)
{
    var i: int;

    i := 0;
    r := 0;

    while (i < n)
        invariant 0 <= i <= n
        invariant r == has_count(v, a, i)
    {
        if (a[i] == v)
        {
            r := r + 1;
        }
        i := i + 1;
    }
    return r;
}
