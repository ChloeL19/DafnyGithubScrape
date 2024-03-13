function Somar(m:nat, n:nat):nat
{
    if (m == 0)
    then n
    else Somar(m-1,n) + 1
}
