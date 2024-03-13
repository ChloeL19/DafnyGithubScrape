method Abs(x: int) returns (y: int)
  ensures 0 <= y  // post-condition
  ensures 1 <= y + 1
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

method LessMore(x: int, y: int) returns (sum: int, sub: int)
  requires y > 0
  ensures sum > x
  ensures sub < x
{
  sum := x + y;
  sub := x - y;
}


// Exercise: 0
method Max(a: int, b: int) returns (c: int)
  // What postcondition should go here, so that the function operates as expected?
  // Hint: there are many ways to write this.
  ensures c >= a
  ensures c >= b
{
  c := a;
  if b > c {
    c := b;
  }
}
