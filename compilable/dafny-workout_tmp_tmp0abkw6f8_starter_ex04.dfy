function max(a: int, b: int): int
{
	if a > b then a else b
}

method Main()
{
	assert max(500, -500) == 500;
	assert max(500, 0) == 500;
	assert max(-500, -501) == -500;
}

