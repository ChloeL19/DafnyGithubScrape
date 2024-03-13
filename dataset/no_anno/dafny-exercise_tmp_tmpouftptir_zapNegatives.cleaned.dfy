method ZapNegatives(a: array<int>) 
{
	var i := 0;
	while i < a.Length
	invariant 0 <= i <= a.Length
	invariant forall j :: 0 <= j < i ==> if old(a[j]) < 0 then a[j] == 0 
											else a[j] == old(a[j])
	invariant forall j :: i <= j < a.Length ==> a[j] == old(a[j])
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
	assert arr[0] == -1 && arr[1] == 2 && arr[2] == 3 && arr[3] == -4;
	ZapNegatives(arr);
	assert arr[0] == 0 && arr[1] == 2 && arr[2] == 3 && arr[3] == 0;
}

