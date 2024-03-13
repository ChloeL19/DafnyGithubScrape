method main(x: int, y: int) returns (x_out: int, y_out: int, n: int)
{
    x_out := x;
    y_out := y;
    n := 0;

    while (x_out != n)
        invariant x_out >= 0
        invariant x_out == y_out
    {
        x_out := x_out - 1;
        y_out := y_out - 1;
    }
}
