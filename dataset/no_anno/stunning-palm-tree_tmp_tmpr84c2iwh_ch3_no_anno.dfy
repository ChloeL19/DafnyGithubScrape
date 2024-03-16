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
  // GH(0) == 0
  // GH(1) == 1 - GH(GH(0)) == 1 - GH(0) == 1
  // GH(2) == 2 - GH(GH(1)) == 2 - GH(1) == 1
  // GH(3) == 3 - GH(GH(2)) == 3 - GH(1) == 2
  // GH(4) == 4 - GH(GH(3)) == 4 - GH(2) == 3
  // GH(5) == 5 - GH(GH(4)) == 5 - GH(3) == 3
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
  // n, 1 > n, 0
  // n, 1 > n - 1, 1
  // n, 1 > n - 1, 0
  // thus,
  // caller: n, 1 > n - 1, 1 > callee: n - 1, 0
{
  if n == 0 then 1 else n - M(F(n - 1))
}

function M(n: nat): nat
{
  if n == 0 then 0 else n - F(M(n - 1))
}
