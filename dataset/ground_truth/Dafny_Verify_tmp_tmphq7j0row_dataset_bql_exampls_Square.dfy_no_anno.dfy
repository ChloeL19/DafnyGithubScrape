method square (n: int) returns (r: int)
{
	var x: int;
	var i: int;

	r := 0;
	i := 0;
	x := 1;

	while (i < n)
	{
		r := r + x;
		x := x + 2;
		i := i + 1;
	}
}
