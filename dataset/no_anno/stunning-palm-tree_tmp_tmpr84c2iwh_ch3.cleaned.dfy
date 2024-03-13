// Ex 3.0
function F0 (x: int): int
{
  if x < 10 then x else F0(x - 1)
}

// Ex 3.1
function G (x: int): int
{
  if 0 <= x then G(x-2) else x
}

// Ex 3.2
function H (x: int): int
{
  if x < -60 then x else H(x - 1)
}

// Ex 3.3
function I (x: nat, y: nat): int
{
  if x == 0 || y == 0 then
    12
  else if x % 2 == y % 2 then
    I(x - 1, y)
  else
    I(x, y - 1)
}

// Ex 3.7
function GH(n: nat): nat
{
  if n == 0 then 0 else n - GH(GH(n - 1))
}

// Ex 3.8
function L(x: int, b: bool): int
{
  if b then x else L(x + 25, true)
}

// Ex 3.13
method Mystery (a: nat) returns (m: nat)
method Outer(a: nat) {
method Outer(a: nat) {
  if a != 0 {
    var b := Mystery(a - 1);
    Inner(a, b);
  }
}

method Inner(a: nat, b: nat)
{
  if b == 0 {
    Outer(a-1);
  } else {
    Inner(a, b - 1);
  }
}

// Ex 3.15
// Hofstadter Female and Male Sequences
function F(n: nat): nat
{
  if n == 0 then 1 else n - M(F(n - 1))
}

function M(n: nat): nat
{
  if n == 0 then 0 else n - F(M(n - 1))
}
