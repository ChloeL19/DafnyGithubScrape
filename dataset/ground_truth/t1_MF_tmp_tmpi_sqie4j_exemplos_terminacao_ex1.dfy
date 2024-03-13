function Somar(m:nat, n:nat):nat
  //decreases m
{
    if (m == 0)
    then n
    else Somar(m-1,n) + 1
}
