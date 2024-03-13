predicate sorted (a: array<int>)
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
		invariant i <= j <= a.Length
		invariant i <= m < a.Length
		invariant forall k :: i <= k < j ==> a[k] >= a[m]
		decreases a.Length - j
	{
		if(a[j] < a[m]) { m := j; }
		j := j + 1;
	}
}

method insertionSort (a: array<int>)
{
	var c := 0;
	while(c < a.Length)
		invariant 0 <= c <= a.Length
		invariant forall k, l :: 0 <= k < c <= l < a.Length ==> a[k] <= a[l]
		invariant sortedA(a, c)
	{
		var m := lookForMin(a, c);
		a[m], a[c] := a[c], a[m];
		assert forall k :: c <= k < a.Length ==> a[k] >= a[c];
		c := c + 1;
	}
}
