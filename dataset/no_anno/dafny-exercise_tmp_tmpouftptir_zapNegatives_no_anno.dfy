method ZapNegatives(a: array<int>) 
{
	var i := 0;
	while i < a.Length
	{
		if a[i] < 0 {
			a[i] := 0;
		}
		i := i + 1;
	}
}

method Main() 
{
	var arr: array<int> :=  new int[][-1, 2, 3, -4];
	ZapNegatives(arr);
}

