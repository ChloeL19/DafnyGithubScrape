// Ex 2.5
method ex25a(x: int) returns (x1: int)
{ x1 := 2 * x; }

method ex25b(x: int, y: int) returns (z: int)
{ z := y - x; }

method ex25c (x: int, N: int) returns (x': int)
{ x' := x + 1; }

method ex26a (x: int) returns (x': int)
{ x' := 1 - x; }

method ex26b (x: int, y: int) returns (y': int)
{ y' := y - x; }

function IsEven (x: int): bool { x % 2 == 0 }

method ex26c (x: int, y: int) returns (x': int, y': int)
{ x', y' := y, x; }

method ex27a (x: int) returns (x': int)
  // 'false' as the WP doesn't include proof obligations like DEFINED(x) from the original formulation as:
  // {{ ? }} x := 400 {{ x == 400 }}
{ x' := 400; }

method ex27b (x: int) returns (x': int)
{ x' := x + 3; }

method ex27c (x: int, y: int) returns (x': int, y': int)
{ x', y' := 65, y; }

method ex28a (b: bool, x: int, y: int) returns (b': bool)
  // requires y < 10 ==> x < y
{ b' := y < 10; }

method ex28b (x: int, y: int) returns (x': int, y': int)
{ x', y' := 2*x, x+y; }

method ex28c (x: int, y: int) returns (x': int, y': int)
  // requires 10 <= 2*y && 2*y <= y
  // required 10 <= 2*y && y <= 0
{ x' := 2 * y; }

method ex213a (x: int, y: int) returns (x': int)
{ x' := 12; }

method ex213b (x: int, y: int) returns (x': int, y': int)
{
  x' := x + 1;
  y' := y;
}

method ex213c (x: int, y: int) returns (x': int, y': int)
{
  x' := x + 1;
  y' := y;
}

method ex213d (x: int, y: int) returns (x': int, y': int)
{
  x' := 3 + y + x;
  y' := y;
}

method ex219 (x: int, y: int) returns (x': int, y': int)
{
  if x < 20 { y' := 3; } else { y' := 2; }
  x' := x;
}

method ex220 (x: int, y: int) returns (x': int, y': int)
  // requires (x < 20 ==> x == 19) && (20 <= x ==> x == 20)
  // requires (20 <= x || x == 19) && (x < 20 || x == 20)
  // requires false || x == 19 || x == 20 || false
{
  if x < 20 { y' := 3; } else { y' := 2; }
  x' := x;
}

method ex221 (x: int, y: int) returns (x': int, y': int)
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
{
  t := Abs(7 * u);
}

// Ex 2.32
method Max (x: int, y: int) returns (m: int)
{
  t := Max(2 * u, u + 7);
}