method Abs(x: int) returns (y: int)
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

method LessMore(x: int, y: int) returns (sum: int, sub: int)
{
  sum := x + y;
  sub := x - y;
}


// Exercise: 0
method Max(a: int, b: int) returns (c: int)
{
  c := a;
  if b > c {
    c := b;
  }
}
