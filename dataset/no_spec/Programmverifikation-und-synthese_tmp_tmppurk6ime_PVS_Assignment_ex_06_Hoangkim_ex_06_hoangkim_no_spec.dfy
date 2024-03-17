
//Problem01
//a)
ghost function gcd(x: int, y: int): int
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
{
    if x == y then x
    else if x > y then gcd'(x - y, y)
    else gcd(y, x)
}

 

