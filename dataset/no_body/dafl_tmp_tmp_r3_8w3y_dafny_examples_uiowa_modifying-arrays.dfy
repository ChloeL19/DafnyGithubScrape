/*
   CS:5810 Formal Methods in Software Engineering
   Fall 2021
   The University of Iowa
   
   Instructor: Cesare Tinelli

   Credits: Example adapted from material by Graeme Smith
*/

/////////////////////
// Modifying arrays 
/////////////////////


method SetEndPoints(a: array<int>, left: int, right: int)
  requires a.Length != 0 
  modifies a 
{/* TODO */ }


method Aliases(a: array<int>, b: array<int>) 
	requires a.Length >= b.Length > 100  
	modifies a 
{/* TODO */ }


// Creating new arrays	

method NewArray() returns (a: array<int>) 
  ensures a.Length == 20 
  ensures fresh(a)
{/* TODO */ } 		

method Caller() 
{/* TODO */ }


// Initializing arrays 

method InitArray<T>(a: array<T>, d: T) 
  modifies a 
  ensures forall i :: 0 <= i < a.Length ==> a[i] == d
{/* TODO */ }


// Referring to prestate values of variables

method UpdateElements(a: array<int>) 
  requires a.Length == 10 
  modifies a 
  ensures old(a[4]) < a[4] 
  ensures a[6] <= old(a[6]) 
  ensures a[8] == old(a[8]) 
{/* TODO */ }


// Incrementing arrays 

method IncrementArray(a: array<int>) 
  modifies a 
  ensures forall i :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
{/* TODO */ }


// Copying arrays 

method CopyArray<T>(a: array<T>, b: array<T>) 
	  requires a.Length == b.Length 
	  modifies b 
	  ensures forall i :: 0 <= i < a.Length ==> b[i] == old(a[i])
	{/* TODO */ }

