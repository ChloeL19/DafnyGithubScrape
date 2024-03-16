/*
   CS:5810 Formal Methods in Software Engineering
   Fall 2017
   The University of Iowa
   
   Instructor: Cesare Tinelli

   Credits: Example adapted from Dafny tutorial
*/

method Find(a: array<int>, key: int) returns (i: int)
                      );
   // if index is negative then
           forall k :: 0 <= k < a.Length ==> a[k] != key;
{
   i := 0;
   while (i < a.Length)
   {
      if (a[i] == key) { return; }
      i := i + 1;
   }
   i := -1;
}


