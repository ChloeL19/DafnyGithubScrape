/* Resources used: https://stackoverflow.com/questions/24591668/selection-sort-in-dafny */


// Here it predicts to check if elements are in ascending order wihtin the given array. 
predicate sorted (a: array<int>)
// This condition here requires array to have n amount of elements.
	requires a != null
	reads a
{
//This condition here sorts which will be strictly increasing. 
	sorted'(a, a.Length)
}

predicate sorted' (a: array<int>, i: int)
	requires a != null
	requires 0 <= i <= a.Length
	reads a
{
// Hrer this is a precondition which loops invariant. 
	forall k :: 0 < k < i ==> a[k-1] <= a[k]
}

// The main method for the insertion sort
method FindMin (a: array<int>, i: int) returns (m: int)
	requires a != null
	// It checks that if a is not empty or not equal to null
	requires 0 <= i < a.Length
	// Here it checks if i is in between 0 and a.length, this is the pre condition that checks the range. 
	ensures i <= m < a.Length
	// Here is another pre condition that we have where the loop invariant checks for all k and i. 
	ensures forall k :: i <= k < a.Length ==> a[k] >= a[m]
{
	var j := i;
	m := i;
	// Here is a while loop condition
	while(j < a.Length)
		invariant i <= j <= a.Length
// More or less it does validates while loop condition during the computations.
		invariant i <= m < a.Length
// The same but having the condition looping through for m variable.
		invariant forall k :: i <= k < j ==> a[k] >= a[m]
		decreases a.Length - j
	// Decrement in j by the a.length
	{
		if(a[j] < a[m]) { m := j; }
		
// And if this condition of array happens then there will be an increment in j. 
		j := j + 1;
	// Here it is a invariant statement at start of each loop iteration. 
	}
}

method InsertionSort (a: array<int>)
	requires a != null
//// It checks that if a is not empty or not equal to null
	modifies a
	ensures sorted(a)
// Chceks for the sorted a
{
	var c := 0;
// Here is the pre/post condition for checking if c is less than the a.length
	while(c < a.Length)
		invariant 0 <= c <= a.Length
		invariant forall k, l :: 0 <= k < c <= l < a.Length ==> a[k] <= a[l]
	// Here to see and check if a or c is sorted wiht the pre/post conditions provided.
		invariant sorted'(a, c)
	{
		var m := FindMin(a, c);
		// Having to find the minimum between a and c 
		a[m], a[c] := a[c], a[m];
		assert forall k :: c <= k < a.Length ==> a[k] >= a[c];
		c := c + 1;
		//Increment in c
	}
}

