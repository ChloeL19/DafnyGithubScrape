// Invariantes não são verificadas pelo dafny, mas precisa deles
// As variantes é para mostrar que o código termina, se não termina o dafny reclama
// O fatorial completo está no arquivo fatorial2.dfy
function Fat(n:nat):nat
{
    if n == 0 then 1 else n*Fat(n-1)
}

method Fatorial(n:nat) returns (f:nat)
