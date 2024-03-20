method Multi(x: int, y: int) returns (r: int)
    requires 0 <= x && 0 <= y
    ensures r == x * y
{
    if x == 0 {
        r := 0;
    } else {
        var z := Multi(x - 1, y);
        r := z + y;
    }
}
