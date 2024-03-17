
predicate sorted(a: array?<int>, l: int, u: int)
	{
	forall i, j :: 0 <= l <= i <= j <= u < a.Length ==> a[i] <= a[j]
	}

method BinarySearch(a: array?<int>, key: int)
	returns (index: int)
{
	var low := 0;
	var high := a.Length;
	while (low < high)
			0 <= i < a.Length && !(low <= i < high) ==> a[i] != key;
	{
		var mid := (low + high) / 2;
		if (a[mid] < key) {
			low := mid + 1;
		}
		else if (key < a[mid]) {
			high := mid;
		}
		else {
			return mid;
		}
	}
	return -1;
}
