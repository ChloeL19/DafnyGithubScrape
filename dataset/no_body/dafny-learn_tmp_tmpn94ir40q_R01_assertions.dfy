method Abs(x: int) returns (y: int)
  ensures 0 <= y
  ensures x < 0 ==> y == -x
  ensures x >= 0 ==> y == x
{/* TODO */ }

method TestingAbs()
{/* TODO */ }

method TestingAbs2()
{/* TODO */ }



// Exercise 1. Write a test method that calls your Max method from Exercise 0 and then asserts something about the result.
// Use your code from Exercise 0
method Max(a: int, b: int) returns (c: int)
  ensures c >= a
  ensures c >= b
{/* TODO */ }
method TestingMax() {/* TODO */ }
