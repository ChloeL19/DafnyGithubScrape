function Somar(x:nat, y:nat):nat
{
    if x == 0
    then y 
    else Somar(x-1,y) + 1
}
