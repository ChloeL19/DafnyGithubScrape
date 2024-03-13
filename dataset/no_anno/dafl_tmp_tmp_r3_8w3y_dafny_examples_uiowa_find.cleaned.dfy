/*
   CS:5810 Formal Methods in Software Engineering
   Fall 2017
   The University of Iowa
   
   Instructor: Cesare Tinelli

   Credits: Example adapted from Dafny tutorial
*/

method Find(a: array<int>, key: int) returns (i: int)
{
   i := 0;
   while (i < a.Length)
     decreases a.Length - i;
     invariant 0 <= i <= a.Length;
     // key is at none of the positions seen so far
     invariant forall k :: 0 <= k < i ==> a[k] != key;
   {
      if (a[i] == key) { return; }
      i := i + 1;
   }
   i := -1;
}


