method Main()
{
	var q := [1,2,4,5,6,7,10,23];
	var i,j := FindAddends(q, 10);
	print "Searching for addends of 10 in q == [1,2,4,5,6,7,10,23]:\n";
	print "Found that q[";
	print i;
	print "] + q[";
	print j;
	print "] == ";
	print q[i];
	print " + ";
	print q[j];
	print " == 10";
}

predicate Sorted(q: seq<int>)
{
	forall i,j :: 0 <= i <= j < |q| ==> q[i] <= q[j] 
}

predicate HasAddends(q: seq<int>, x: int)
{
	exists i,j :: 0 <= i < j < |q| && q[i] + q[j] == x
}

method FindAddends(q: seq<int>, x: int) returns (i: nat, j: nat)
{
	i := 0;
	j := |q| - 1;
	var sum := q[i] + q[j];

	while sum != x
	{
		if (sum > x)
		{
			// Sum it too big, lower it by decreasing the high index
			LoopInvWhenSumIsBigger(q, x, i, j, sum);
			j := j - 1;
		}
		// 'sum == x' cannot occur because the loop's guard is 'sum !=x'.
		else // (sum < x)
		{
			// Sum is too small, make it bigger by increasing the low index.
			i := i + 1;
		}

		sum := q[i] + q[j];
	}
}

predicate IsValidIndex<T>(q: seq<T>, i: nat)
{
	0 <= i < |q|
}

predicate AreOreredIndices<T>(q: seq<T>, i: nat, j: nat)
{
	0 <= i < j < |q|
}

predicate AreAddendsIndices(q: seq<int>, x: int, i: nat, j: nat)
{
	q[i] + q[j] == x
}

predicate HasAddendsInIndicesRange(q: seq<int>, x: int, i: nat, j: nat)
{
	HasAddends(q[i..(j + 1)], x)
}

predicate LoopInv(q: seq<int>, x: int, i: nat, j: nat, sum: int)
{
	AreOreredIndices(q, i, j) &&
	HasAddendsInIndicesRange(q, x, i, j) &&
	AreAddendsIndices(q, sum, i, j)
}

lemma LoopInvWhenSumIsBigger(q: seq<int>, x: int, i: nat, j: nat, sum: int)
{
}

