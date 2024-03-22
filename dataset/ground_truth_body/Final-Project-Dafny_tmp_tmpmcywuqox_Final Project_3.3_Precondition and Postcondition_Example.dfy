method naturalNumberN(x: int, N: int) returns (Sum: int, Difference: int)
  requires N >= 0
  ensures Difference <= x <= Sum
{
  Sum := x + N;
  Difference := x - N;
}
