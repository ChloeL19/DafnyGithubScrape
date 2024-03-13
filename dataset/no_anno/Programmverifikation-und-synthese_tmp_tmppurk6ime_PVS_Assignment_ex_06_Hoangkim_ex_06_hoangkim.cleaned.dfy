
//Problem01
//a)
ghost function gcd(x: int, y: int): int
    requires x > 0 && y > 0
{
    if x == y then x
    else if x > y then gcd(x - y, y)
    else gcd(x, y - x)
}

method gcdI(m: int, n: int) returns (d: int)
{
    var x: int;
    d := m;
    x := n;
    while (d != x)
    invariant x > 0;
    invariant d > 0;
    invariant gcd(d, x) == gcd(m, n);
    decreases x+d;
    {
        if (d > x)
        {
            d := d - x;
        }
        else
        {
            x := x - d;
        }
    }
}

//b)
ghost function gcd'(x: int, y: int): int
    requires x > 0 && y > 0
    decreases if x > y then x else y
{
    if x == y then x
    else if x > y then gcd'(x - y, y)
    else gcd(y, x)
}

 

