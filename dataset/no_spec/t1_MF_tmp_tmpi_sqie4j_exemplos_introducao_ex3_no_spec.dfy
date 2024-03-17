method SumMax(x:int, y:int) returns (s:int, m:int) //podemos retornar múltiplos valores
{
    s := x + y;
    if x < y {
        m := y;
    } else {
        m := x;
    }
}
