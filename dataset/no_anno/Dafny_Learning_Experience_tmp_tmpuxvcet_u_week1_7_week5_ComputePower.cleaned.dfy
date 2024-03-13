 function Power(n:nat):nat 
{
    if n == 0 then 1 else 2 * Power(n-1)
}

method CalcPower(n:nat) returns (p:nat)
{
    p := 2*n;
}

method ComputePower(n:nat) returns (p:nat)
{
    p:=1;
    var i:=0;
    while i!=n
        invariant 0 <= i <= n
        invariant p *Power(n-i) == Power(n) 
    {
        p:= CalcPower(p);
        i:=i+1;
    }
}
