method add_small_numbers (a: array<int>, n: int, max: int) returns (r: int)
{
	var i: int;	

	i := 0;
	r := 0;

	while (i < n)
		invariant i <= n;
		invariant r <= max * i;
	{
		r := r + a[i];
		i := i + 1;
	}
}
