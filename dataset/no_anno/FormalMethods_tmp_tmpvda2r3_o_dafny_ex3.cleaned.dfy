/*
Função Recursiva
Somar: N x N --> N
{Somar (m,n) = m, se n=0}
{Somar (m, n) = Somar(m, n-1) + 1, se n>0}
*/
// Expressão. Não é comando. Apenas equação
// Dafny analisou e viu que não possui loop
function Somar(m:nat, n:nat):nat
{
    if n == 0
    then m
    else Somar(m, n-1) + 1
}
