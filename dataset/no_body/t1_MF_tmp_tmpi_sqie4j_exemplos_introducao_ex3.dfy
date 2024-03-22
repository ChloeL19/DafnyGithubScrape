method SumMax(x:int, y:int) returns (s:int, m:int) //podemos retornar múltiplos valores
 requires x >= 0 && y >= 0
 ensures s == x + y
 ensures x <= m && y <= m
 ensures m == x || m == y
{/* TODO */ }
