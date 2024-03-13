// Como se constroi uma função no dafny

// Somar: NxN -> N
// {Somar(m,n) = m, se n = 0
// {Somar(m,n) = Somar(m,n-1) + 1, se n > 0
function Somar(m:nat, n:nat):nat
{
    if n == 0
    then m
    else Somar(m,n-1)+1
}