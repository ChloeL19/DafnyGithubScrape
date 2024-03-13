method Abs(x: int) returns (y: int)
{
	return -x;
}

method Main()
{
	var a := Abs(-3);
	assert a == 3;
}

