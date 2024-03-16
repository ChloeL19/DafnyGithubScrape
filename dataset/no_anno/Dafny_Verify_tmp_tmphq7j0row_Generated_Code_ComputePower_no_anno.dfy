function Power(n: nat): nat {
    if n == 0 then 1 else 2 * Power(n - 1)
}

method ComputePower(n: nat) returns (p: nat)
{
    p := 1;
    var i := 0;
    while i != n
    {
        i := i + 1;
        p := p * 2;
    }
}
