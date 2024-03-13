method min(a: array<int>, n : int) returns (min : int)
{
	var i : int;

	min := a[0];
	i := 1;

	while (i < n)
		invariant i <= n;
		invariant (exists j : int :: 0 <= j && j < i && a[j] == min);
		invariant (forall j : int :: 0 <= j && j < i ==> a[j] >= min);
	{
		if (a[i] < min) {
			min := a[i];
		}
		i := i + 1;
	}
}

