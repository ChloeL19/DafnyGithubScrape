// Sorting: 
//        Pre/Post Condition Issues - An investigation 
//                                      -- Stephanie McIntyre
// Based on examples in class 

// First Attempt at specifying requirements for sorting array A in incrementing order
// We want our Hoare triple of (|Pre-Condition|) Code (|Post-Condition|) to hold iff A is properly sorted.

method sort(A: array<int>, n: int)
{
  var k := 0;
  while(k<n)
  invariant k<=n;
  invariant forall i:: 0<=i<k ==> A[i]==i;
  {
    A[k] := k;
    k := k+1;
  }
}

