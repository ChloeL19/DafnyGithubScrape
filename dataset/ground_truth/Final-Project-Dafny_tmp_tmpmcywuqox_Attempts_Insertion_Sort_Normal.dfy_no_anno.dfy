predicate sorted (a: array<int>)

	reads a
{
	sortedA(a, a.Length)
}

predicate sortedA (a: array<int>, i: int)

{
	forall k :: 0 < k < i ==> a[k-1] <= a[k]
}

method lookForMin (a: array<int>, i: int) returns (m: int)

{
	var j := i;
	m := i;
	while(j < a.Length)
	{
		if(a[j] < a[m]) { m := j; }
		j := j + 1;
	}
}

method insertionSort (a: array<int>)

{
	var c := 0;
	while(c < a.Length)
	{
		var m := lookForMin(a, c);
		a[m], a[c] := a[c], a[m];
		c := c + 1;
	}
}
