// Collatz conjecture
method Coisa(x:nat)
decreases *
{
    var n := x;
    while n > 1
    decreases * // Desabilita a verificação de terminação para correção parcial.
    {
        n := if n%2 == 0 then n/2 else 3*n+1;
    }
}

