function Potencia(x: nat, y: nat): nat
{
    if y == 0
    then 1
    else x * Potencia(x, y-1) 
}

method Pot(x: nat, y: nat) returns (r: nat)
ensures r == Potencia(x,y)
{/* TODO */ }
