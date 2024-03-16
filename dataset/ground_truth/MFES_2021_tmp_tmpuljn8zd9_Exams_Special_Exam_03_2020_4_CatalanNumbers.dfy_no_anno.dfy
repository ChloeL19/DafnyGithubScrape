function C(n: nat): nat 
    decreases n
{
    if n == 0 then 1 else (4 * n - 2) * C(n-1) / (n + 1) 
}

method calcC(n: nat) returns (res: nat)
{
    var i := 0;
    res := 1;

    {
      ghost var v0 := n - i;
        i := i + 1;
        res := (4 * i - 2) * res / (i + 1);
    }
}

