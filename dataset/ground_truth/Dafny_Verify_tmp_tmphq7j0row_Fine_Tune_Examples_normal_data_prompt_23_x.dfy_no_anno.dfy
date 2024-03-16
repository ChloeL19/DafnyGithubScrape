method main(n: int) returns (sum: int, i: int)
{
    sum := 0;
    i := 0;
    while(i < n)
    {
        sum := sum + i;
        i := i + 1;
    }
}
