method MaxSum(x: int, y: int) returns (s: int, m: int)
{
    s := x + y;
    if (x > y) {
        m := x;
    } else {
        m := y;
    }

    return s, m;
}
