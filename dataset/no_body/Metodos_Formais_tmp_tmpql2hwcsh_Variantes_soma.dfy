function Somar(x:nat, y:nat):nat
decreases x // o x é alterado decrescente, então é minha variante, mostrando que a função não
// é infinita
{
    if x == 0
    then y 
    else Somar(x-1,y) + 1
}
