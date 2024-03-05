method appendArray(a: array<int>, b: array<int>) returns (c: array<int>)
{
	c := new int[a.Length + b.Length];
	
	var i := 0;
	while i < a.Length
	invariant 0 <= i <= a.Length
	invariant forall j :: 0 <= j < i ==> c[j] == a[j]
	{
		c[i] := a[i];
		i := i + 1;
	}
	
	while i < b.Length + a.Length
	invariant a.Length <= i <= b.Length + a.Length
	invariant forall j :: 0 <= j < a.Length ==> a[j] == c[j]
	invariant forall j :: a.Length <= j < i ==> c[j] == b[j - a.Length]
	{
		c[i] := b[i - a.Length];
		i := i + 1;
	}
}
