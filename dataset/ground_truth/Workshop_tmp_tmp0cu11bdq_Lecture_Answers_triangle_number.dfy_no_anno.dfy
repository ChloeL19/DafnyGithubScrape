method TriangleNumber(N: int) returns (t: int)
{
    t := 0;
    var n := 0;
    while n < N
        decreases N - n;// can be left out because it is guessed correctly by Dafny
    {
        n:= n + 1;
        t := t + n;
    }
}
