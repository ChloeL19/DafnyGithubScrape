// Exercise 3. Keeping the postconditions of Abs the same as above, change the body of Abs to just y := x + 2. 


method Abs(x: int) returns (y: int)
	
	requires x == -1
	
	ensures 0 <= y
	ensures 0 <= x ==> x == y
	ensures x < 0 ==> y == -x
{
	y := x + 2;
}

// What precondition do you need if the body is y := x + 1?
method Abs2(x: int) returns (y: int)
    requires x > 0
	ensures 0 <= y
	ensures x < 0 ==> y == -x
{
	y := x + 1;
}


