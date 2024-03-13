method GCD1(a: int, b: int) returns (r: int)
{
    if a < b {
        r := GCD1(b, a);
    } else if (a % b == 0) {
        r := b;
    } else {
        r := GCD1(b, a % b);
    }
}


method GCD2(a: int, b: int) returns (r: int)
{
    if b == 0 {
        r := a;
    } else {
        r := GCD2(b, a % b);
    }
}
