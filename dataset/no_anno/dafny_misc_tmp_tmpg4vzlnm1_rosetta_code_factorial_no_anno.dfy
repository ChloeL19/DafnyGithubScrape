// recursive definition of factorial
function Factorial(n: nat): nat {
  if n == 0 then 1 else n * Factorial(n - 1)
}

// iterative implementation of factorial
method IterativeFactorial(n: nat) returns (result: nat)
{
  result := 1;
  var i := 1;
  while i <= n
  {
    result := result * i;
    i := i + 1;
  }
}

