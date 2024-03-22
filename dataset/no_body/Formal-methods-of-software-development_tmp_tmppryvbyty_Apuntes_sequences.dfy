// **** SEQUENCES ****
/* Sets of various types form one of the core tools of verification for Dafny. Sets represent an 
orderless collection of elements, without repetition. Like sequences, sets are immutable value 
types. This allows them to be used easily in annotations, without involving the heap, as a set 
cannot be modified once it has been created. */
predicate sorted(s: seq<int>){ forall i,j :: 0 <= i < j < |s| ==> s[i] <= s[j] }
predicate sorted2(s: seq<int>){ 0 < |s| ==> (forall i :: 0 < i < |s| ==> s[0] <= s[i]) && sorted2(s[1..]) }

// The notation s[1..] is slicing the sequence. It means starting at the first element, 
// take elements until you reach the end. 

// The notation s[i..j] is like the last mentiones, but taking elements starting in i and 
// ending in j.

method ej2()
{/* TODO */ }
