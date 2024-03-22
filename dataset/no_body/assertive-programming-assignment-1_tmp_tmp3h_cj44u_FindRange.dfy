method Main()
{/* TODO */ }

predicate Sorted(q: seq<int>)
{
	forall i,j :: 0 <= i <= j < |q| ==> q[i] <= q[j] 
}

method {:verify true} FindRange(q: seq<int>, key: int) returns (left: nat, right: nat)
	requires Sorted(q)
	ensures left <= right <= |q|
	ensures forall i :: 0 <= i < left ==> q[i] < key
	ensures forall i :: left <= i < right ==> q[i] == key
	ensures forall i :: right <= i < |q| ==> q[i] > key
{/* TODO */ }

// all the values in the range satisfy `comparer` (comparer(q[i], key) == true)
predicate RangeSatisfiesComparer(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool)
	requires 0 <= lowerBound <= upperBound <= |q|
{
	forall i :: lowerBound <= i < upperBound ==> comparer(q[i], key)
}

// all the values in the range satisfy `!comparer` (comparer(q[i], key) == false)
predicate RangeSatisfiesComparerNegation(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool)
	requires 0 <= lowerBound <= upperBound <= |q|
{
	RangeSatisfiesComparer(q, key, lowerBound, upperBound, (n1, n2) => !comparer(n1, n2))
}

method BinarySearch(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool) returns (index: nat)
	requires Sorted(q)
	requires 0 <= lowerBound <= upperBound <= |q|
	requires RangeSatisfiesComparerNegation(q, key, 0, lowerBound, comparer)
	requires RangeSatisfiesComparer(q, key, upperBound, |q|, comparer)
	// comparer is '>' or '>='
	requires
		(forall n1, n2 :: comparer(n1, n2) == (n1 >  n2)) ||
		(forall n1, n2 :: comparer(n1, n2) == (n1 >= n2))

	ensures lowerBound <= index <= upperBound
	ensures RangeSatisfiesComparerNegation(q, key, 0, index, comparer)
	ensures RangeSatisfiesComparer(q, key, index, |q|, comparer)
{/* TODO */ }

