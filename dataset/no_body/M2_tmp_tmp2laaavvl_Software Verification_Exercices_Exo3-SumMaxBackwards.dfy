method SumMaxBackwards(s:int, m :int) returns (x:int, y:int)
    requires m >= s - m  // s <= 2m
    ensures s == x + y
    ensures x <= m && y <= m
    ensures m == x || m == y
{/* TODO */ }
