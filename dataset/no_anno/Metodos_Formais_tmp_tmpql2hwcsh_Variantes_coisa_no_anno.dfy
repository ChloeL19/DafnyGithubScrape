method Coisa(x:nat) // teorema de Collatz, não tem solução definida
{
    var n := x;
    while n > 1
    {
        n := if n%2 == 0 then n/2 else 3*n+1;
    }
}
