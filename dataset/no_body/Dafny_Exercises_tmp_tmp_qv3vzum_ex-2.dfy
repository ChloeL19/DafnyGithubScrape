// Exercise 2. Using a precondition, change Abs to say it can only be called on negative values. Simplify the body of Abs into just one return statement and make sure the method still verifies.

method Abs(x: int) returns (y: int)
	requires x < 0
	ensures 0 <= y
	ensures 0 <= x ==> x == y
	ensures x < 0 ==> y == -x
{/* TODO */ }
