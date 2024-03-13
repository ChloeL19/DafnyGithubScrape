// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This is a Dafny adaptation of a Coq program by David Pichardie.

function IsEven(n: int): bool
{
  (n/2)*2 == n
}

function Square(n: int): int { n * n }
function Square(n: int): int { n * n }

function pow2(n: int): int
{
  if n == 0 then
    1
  else if IsEven(n) then
    Square(pow2(n / 2))
  else
    2*pow2(n-1)

}

function pow2_slow(n: int): int
{
  if n == 0 then
    1
  else
    2*pow2_slow(n-1)
}

lemma Lemma(n: int)
{
  if n != 0 {
    Lemma(n-2);
  }
}

lemma Theorem(n: int)
{
  if n == 0 {
  } else if (IsEven(n)) {
    Lemma(n);
    Theorem(n/2);
  } else {
    Theorem(n-1);
  }
}

