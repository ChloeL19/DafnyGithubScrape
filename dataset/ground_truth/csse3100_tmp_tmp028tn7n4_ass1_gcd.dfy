method GCD1(a: int, b: int) returns (r: int)
    decreases a % b
    requires a > 0 && b > 0 && a != b
    // ensures r == gcd(a, b)
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
    decreases b + 1
    requires a >= 0 && b >= 0
    // ensures r == gcd(a, b)
{
    if b == 0 {
        r := a;
    } else {
        r := GCD2(b, a % b);
    }
}
