method GCD1(a: int, b: int) returns (r: int)
    decreases a % b
    requires a > 0 && b > 0 && a != b
    // ensures r == gcd(a, b)
{/* TODO */ }


method GCD2(a: int, b: int) returns (r: int)
    decreases b + 1
    requires a >= 0 && b >= 0
    // ensures r == gcd(a, b)
{/* TODO */ }
