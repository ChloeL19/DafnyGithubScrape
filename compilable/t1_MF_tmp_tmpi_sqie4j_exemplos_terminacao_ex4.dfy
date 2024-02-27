method Collatz(x: nat)
  decreases * //desabilita a verificação da terminação
{
    var n := x;
    while 1 < n
      decreases * //desabilita a verificação da terminação
    {
        n := if n % 2 == 0 then n / 2 else n * 3 + 1;
    }
}

