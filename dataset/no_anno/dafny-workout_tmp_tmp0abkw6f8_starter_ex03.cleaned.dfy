method Abs(x: int) returns (y: int)
{
	return x + 2;
}

method Abs2(x: real) returns (y: real)
{
	return x + 1.0;
}

method Main()
{
	var a := Abs(-1);
	assert a == 1;
	var a2 := Abs2(-0.5);
	assert a2 == 0.5;
}

