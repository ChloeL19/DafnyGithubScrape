
method FindMax(a: array<int>) returns (max_idx: nat)
{
	max_idx := 0;
	var i: nat := 1;
	while i < a.Length
		decreases a.Length - i
		invariant 1 <= i <= a.Length
		invariant 0 <= max_idx < i
		invariant forall j :: 0 <= j < i ==> a[max_idx] >= a[j]
	{
		if a[i] > a[max_idx]
		{
			max_idx := i;
		}
		i := i + 1;
	}
	return max_idx;
}

method Main()
{
	var arr: array<int> := new int[][1, 1, 25, 7, 2, -2, 3, 3, 20];
	var idx := FindMax(arr);

	assert forall i :: 0 <= i < arr.Length ==> arr[idx] >= arr[i];
	// apparently I can't assert definite values like
	// assert idx == 2
	// or assert arr[idx] == 25
}

