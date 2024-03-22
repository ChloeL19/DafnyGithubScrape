method Abs(x: int) returns (y: int)
  ensures 0 <= y  // post-condition
  ensures 1 <= y + 1
{/* TODO */ }

method LessMore(x: int, y: int) returns (sum: int, sub: int)
  requires y > 0
  ensures sum > x
  ensures sub < x
{/* TODO */ }


// Exercise: 0
method Max(a: int, b: int) returns (c: int)
  // What postcondition should go here, so that the function operates as expected?
  // Hint: there are many ways to write this.
  ensures c >= a
  ensures c >= b
{/* TODO */ }
