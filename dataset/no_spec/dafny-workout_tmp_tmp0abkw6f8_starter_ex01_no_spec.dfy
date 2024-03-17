method Max(a: int, b: int) returns (c: int)
{
	if (a >= b)
	{
		return a;
	} else {
		return b;
	}
}

method Main()
{
	print "Testing max...\n";

	var max := Max(3, 4);
	max := Max(-3, 4);
	max := Max(-3, -4);
	max := Max(5555555, 5555);
}

