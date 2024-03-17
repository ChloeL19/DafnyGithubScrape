function Ackermann(m: nat, n: nat): nat
  //decreases m, n
{
    if m == 0
    then n+1
    else if n == 0
         then Ackermann(m-1, 1)
         else Ackermann(m-1, Ackermann(m, n-1))
}
