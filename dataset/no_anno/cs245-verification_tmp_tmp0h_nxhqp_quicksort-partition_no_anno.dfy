// Quicksort Partition -- Stephanie McIntyre
// Based on examples in class 
// Parts have been modified cause you know, arrays are different...
   
method QuicksortPartition(X: array<int>, n: int, p: int) returns (a: int, b: int)
/*Pre-Condition*/   requires X.Length>=1 && n == X.Length;
/*Post-Condition*/  ensures b>=n;
{
  a := 0;
  while ( a < n && X[a] <= p ) 
  { 
    a := a+1;
  }
  
  b := a+1;
  
  while ( b<n )
  { 
    if ( X[b] <= p ) {
      var t := X[b]; 
      X[b] := X[a]; 
      X[a] := t; 
      a := a+1;
    }
    b := b+1;
  }
}

/* The annotations and implied proofs are left for you.
   I might do them later on next week. */

