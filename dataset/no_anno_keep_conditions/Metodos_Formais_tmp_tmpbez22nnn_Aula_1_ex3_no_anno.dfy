function Somar(m:nat, n:nat): nat
{
    if n == 0
    then m
    else Somar(m, n-1) + 1
}
