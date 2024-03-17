method Abs(x:int) returns (r:int)
// ensures r >= 0
// ensures x < 0 ==> r == -x // -x == x * -1; ==> Se/Então lógico.
// ensures x >= 0 ==> r == x // Se x>=0, então r é igual a x
{
    if x < 0
    {
        return -x;
    }
    else
    {
        return x;
    }
}
