// Exercise 3. Keeping the postconditions of Abs the same as above, change the body of Abs to just y := x + 2. 


method Abs(x: int) returns (y: int)
{
	y := x + 2;
}

// What precondition do you need if the body is y := x + 1?
method Abs2(x: int) returns (y: int)
{
	y := x + 1;
}


