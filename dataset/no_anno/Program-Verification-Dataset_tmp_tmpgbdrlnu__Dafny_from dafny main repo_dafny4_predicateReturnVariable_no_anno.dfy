// RUN: %testDafnyForEachResolver "%s"


predicate tautology1(x: int): (y: bool)
{
  x >= 2
}
