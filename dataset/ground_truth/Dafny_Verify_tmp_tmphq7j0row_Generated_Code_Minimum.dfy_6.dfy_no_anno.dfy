method Minimum(a: array<int>) returns (m: int) 
{
	var n := 0;
	m := a[0];
	while n != a.Length
	{
		if a[n] < m {
			m := a[n];
		}
		n := n + 1;
	}
}
