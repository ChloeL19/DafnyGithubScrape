// Ex 2.5
method ex25a(x: int) returns (x1: int)
  requires 0 <= x < 100
  ensures 0 <= x1 < 200
{ x1 := 2 * x; }

method ex25b(x: int, y: int) returns (z: int)
  requires 0 <= x <= y < 100
  ensures 0 <= z < 100
{ z := y - x; }

method ex25c (x: int, N: int) returns (x': int)
  requires 0 <= x < N
  ensures x' <= N
{ x' := x + 1; }

method ex26a (x: int) returns (x': int)
  requires -128 <= x < 0
  ensures 2 <= x' < 130
{ x' := 1 - x; }

method ex26b (x: int, y: int) returns (y': int)
  requires 0 <= x <= y < 100
  ensures 0 <= y' < 100
{ y' := y - x; }

function IsEven (x: int): bool { x % 2 == 0 }

method ex26c (x: int, y: int) returns (x': int, y': int)
  requires IsEven(x) && y < 100
  ensures IsEven(y') && x' < 100
{ x', y' := y, x; }

method ex27a (x: int) returns (x': int)
  // 'false' as the WP doesn't include proof obligations like DEFINED(x) from the original formulation as:
  // {{ ? }} x := 400 {{ x == 400 }}
  requires true
  ensures x' == 400
{ x' := 400; }

method ex27b (x: int) returns (x': int)
  requires !IsEven(x)
  ensures IsEven(x')
{ x' := x + 3; }

method ex27c (x: int, y: int) returns (x': int, y': int)
  requires y <= 65
  ensures y' <= x'
{ x', y' := 65, y; }

method ex28a (b: bool, x: int, y: int) returns (b': bool)
  // requires y < 10 ==> x < y
  requires y >= 10 || x < y
  ensures b' ==> x < y
{ b' := y < 10; }

method ex28b (x: int, y: int) returns (x': int, y': int)
  requires 0 <= x <= 50 && y <= x
  ensures 0 <= x' <= 100 && y' <= x'
{ x', y' := 2*x, x+y; }

method ex28c (x: int, y: int) returns (x': int, y': int)
  // requires 10 <= 2*y && 2*y <= y
  // required 10 <= 2*y && y <= 0
  requires false
  ensures 10 <= x' <= y'
{ x' := 2 * y; }

method ex213a (x: int, y: int) returns (x': int)
  requires y == 10
  ensures y == 10 && x' == 12  // can we express "exists x0 :: ..." in a post-condition?
{ x' := 12; }

method ex213b (x: int, y: int) returns (x': int, y': int)
  requires 98 <= y
  ensures x' == x + 1 && 98 <= y'
{
  x' := x + 1;
  y' := y;
}

method ex213c (x: int, y: int) returns (x': int, y': int)
  requires 98 <= x
  ensures 99 <= x'
{
  x' := x + 1;
  y' := y;
}

method ex213d (x: int, y: int) returns (x': int, y': int)
  requires 98 <= y < x
  // ensures 98 <= y' && y' < x && x' == 3 + y' + x
  // ensures 98 <= y' && y' < x' - 3 - y'
  ensures 98 <= y' && 2*y' + 3 < x'
{
  x' := 3 + y + x;
  y' := y;
}

method ex219 (x: int, y: int) returns (x': int, y': int)
  requires x < 100
  ensures (x' < 20 && y' == 3) || (20 <= x' < 100 && y' == 2)
{
  if x < 20 { y' := 3; } else { y' := 2; }
  x' := x;
}

method ex220 (x: int, y: int) returns (x': int, y': int)
  // requires (x < 20 ==> x == 19) && (20 <= x ==> x == 20)
  // requires (20 <= x || x == 19) && (x < 20 || x == 20)
  // requires false || x == 19 || x == 20 || false
  requires x == 19 || x == 20
  ensures x' + y' == 22
{
  if x < 20 { y' := 3; } else { y' := 2; }
  x' := x;
}

method ex221 (x: int, y: int) returns (x': int, y': int)
  requires x != 5
  ensures y' < 10
{
  if x < 8 {
    if x == 5 {
      y' := 10;
    } else {
      y' := 2;
    }
  } else {
    y' := 0;
  }
  x' := x;
}

method ex222 (x: int, y: int) returns (x': int, y': int)
  requires x >= 10
  ensures IsEven(y')
{
  if x < 10 {
    if x < 20 {
      y' := 1;
    } else {
      y' := 2;
    }
  } else {
    y' := 4;
  }
  x' := x;
}

method ex223 (x: int, y: int) returns (x': int, y': int)
  // requires (x < 8 ==> (x < 4 ==> IsEven(y)) && (4 <= x ==> true)) && (8 <= x ==> (x < 32 ==> false) && (32 <= x ==> IsEven(y)))
  // requires (x < 8 ==> (x < 4 ==> IsEven(y))) && (8 <= x ==> (32 <= x) && (32 <= x ==> IsEven(y)))
  // requires (4 <= x || IsEven(y)) && (x < 8 || ((32 <= x) && IsEven(y)))
  requires (4 <= x < 8) || (x < 8 && IsEven(y)) || (32 <= x && IsEven(y))
  ensures IsEven(y')
{
  x' := x;
  y' := y;
  if x < 8 {
    // WP = (x < 4 ==> IsEven(y)) && (4 <= x ==> true)
    if x < 4 {
      x' := x + 1;
    } else {
      y' := 2;
    }
  } else {
    // WP = (x < 32 ==> false) && (32 <= x ==> IsEven(y))
    if x < 32 {
      y' := 1;
    }
  }
}

// Ex 2.31
method Abs (x: int) returns (y: int)
  ensures 0 <= y && (x == y || x == -y)

method ex231 (u: int) returns (t: int)
  // WP[t := M(E), Q] = forall y' :: R[x,y := E,y'] ==> Q[t := y']
  // E = 7 * u, M = Abs, x = u, y = t
  // requires forall y' >= 0 :: (7*u == y' || 7*u == -y') ==> u < y'
  requires u != 0
  ensures u < t
{
  t := Abs(7 * u);
}

// Ex 2.32
method Max (x: int, y: int) returns (m: int)
  ensures m == x || m == y
  ensures x <= m && y <= m

method ex232 (u: int) returns (t: int)
  // forall y' :: (y' == 2 * u || y' == u + 7) && 2 * u <= y' && u + 7 <= y' ==> IsEven(y')
  // (u + 7 <= 2 * u ==> IsEven(2 * u)) || (2 * u <= u + 7 ==> IsEven(u + 7))
  // true || (2 * u <= u + 7 ==> IsEven(u + 7))
  // 2 * u <= u + 7 ==> IsEven(u + 7)
  requires 2 * u <= u + 7 ==> IsEven(u + 7)
  ensures IsEven(t)
{
  t := Max(2 * u, u + 7);
}
