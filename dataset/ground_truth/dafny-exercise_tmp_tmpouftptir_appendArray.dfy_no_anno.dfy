method appendArray(a: array<int>, b: array<int>) returns (c: array<int>)
{
	c := new int[a.Length + b.Length];
	
	var i := 0;
	while i < a.Length
	{
		c[i] := a[i];
		i := i + 1;
	}
	
	while i < b.Length + a.Length
	{
		c[i] := b[i - a.Length];
		i := i + 1;
	}
}

