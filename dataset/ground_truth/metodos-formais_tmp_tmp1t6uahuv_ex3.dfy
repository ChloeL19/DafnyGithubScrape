method SumMax(x:int, y:int) returns (s:int, m:int)
    requires x >= 0 && y >= 0
    ensures s == x + y
    ensures m >= x && m >= y
    ensures m == x || m ==y
{
    s := x + y;
    if ( x > y ) {
        m := x;
    }
    else {
        m := y;
    }
}
