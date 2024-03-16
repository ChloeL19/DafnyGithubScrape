//Problem01
//a)
method swap(a: array<int>, i: nat, j: nat)
{
    a[i], a[j] := a[j], a[i];
}

//b)
//Problem04
method FindMin(a: array<int>, lo: nat) returns (minIdx: nat)
{
    var j := lo;
	minIdx := lo;
	while j < a.Length
	{
		if(a[j] < a[minIdx]) { minIdx := j; }
		j := j + 1;
	}
}

//Problem02
ghost predicate sorted(a:seq<int>)
{
    forall i | 0 < i < |a| :: a[i-1] <= a[i]     
}

method selectionSort(a: array<int>)
{
	var i := 0;
	while(i < a.Length)
	{
		var mx := FindMin(a, i);
		//swap(a,i,mx);
        a[i], a[mx] := a[mx], a[i];
		i := i + 1;
	}

}


//Problem03



