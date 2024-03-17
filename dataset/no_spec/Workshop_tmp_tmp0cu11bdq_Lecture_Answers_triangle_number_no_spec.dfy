method TriangleNumber(N: int) returns (t: int)
{
    t := 0;
    var n := 0;
    while n < N
    {
        n:= n + 1;
        t := t + n;
    }
}
