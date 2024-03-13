function Ack(m:nat, n:nat):nat
//como os dois juntos são um produto cartesiano, mostramos os dois juntos no decreases
decreases m,n
{
    if m == 0
    then n+1
    else if n == 0
        then Ack(m-1,1)
        else Ack(m-1, Ack(m,n-1))
}
