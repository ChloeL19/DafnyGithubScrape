function SomaAte(a:array<nat>, i:nat):nat
{
    if i == 0
    then 0
    else a[i-1] + SomaAte(a,i-1)
}

method Somatorio(a:array<nat>) returns (s:nat)
{
    var i := 0;
    s := 0;
    while i < a.Length
    {
        s := s + a[i];
        i := i + 1;
    }
}
