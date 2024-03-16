method main(n : int) returns (i: int, x: int, y:int)
{
    i := 0;
    x := 0;
    y := 0;

    while (i < n)
    {
        i := i + 1;
        x := x + 1;
        if (i % 2 == 0)
        {
            y := y + 1;
        }
        else
        {}
    }
}
