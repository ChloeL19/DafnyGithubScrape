function Fat(n: nat): nat
{
   if n == 0 then 1 else n * Fat(n-1)
}

method Fatorial(n:nat)  returns (r:nat)
{
    r := 1;
    var i := 0;
    while i < n
    {
        i := i + 1;
        r := r * i;
    }
}
