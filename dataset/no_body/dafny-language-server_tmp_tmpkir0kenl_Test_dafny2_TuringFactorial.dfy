// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function Factorial(n: nat): nat
{
  if n == 0 then 1 else n * Factorial(n-1)
}

method ComputeFactorial(n: int) returns (u: int)
  requires 1 <= n;
  ensures u == Factorial(n);
{/* TODO */ }

