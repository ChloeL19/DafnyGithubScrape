method min(a: array<int>, n : int) returns (min : int)
{
	var i : int;

	min := a[0];
	i := 1;

	while (i < n)
	{
		if (a[i] < min) {
			min := a[i];
		}
		i := i + 1;
	}
}

