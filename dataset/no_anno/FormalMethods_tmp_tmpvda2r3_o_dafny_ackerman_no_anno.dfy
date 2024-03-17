function Ack(m:nat, n:nat):nat
// Produto cartesiano, um par de valores (NxN, <) --> ordem lexicográfica
// Exemplo:
//(0,1) < (1,1)
//(1,0) > (0,1)
//(0,1) > (0,0)
// Compara primeiro elemento. Se forem iguais compara o segundo elemento.
// É o par maior quem for o elemento maior primeiro
{
    if m == 0
    then n+1
    else if n == 0
        then Ack(m-1,1)
        else Ack(m-1, Ack(m,n-1))
}
