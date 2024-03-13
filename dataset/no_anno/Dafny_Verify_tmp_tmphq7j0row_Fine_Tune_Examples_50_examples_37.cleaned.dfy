method main(n: int) returns(x: int, m: int)
{
    x := 0;
    m := 0;

    while(x < n)
        invariant 0 <= x <= n
        invariant 0 <= m < n
    {
        if(*)
        {
            m := x;
        }
        else{}
        x := x + 1;
    }
}
