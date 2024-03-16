method main(n: int, k: int) returns (i :int, j: int)
{
    i := 0;
    j := 0;
    while(i < n)
    {
        i := i + 1;
        j := j + i;
    }
}
