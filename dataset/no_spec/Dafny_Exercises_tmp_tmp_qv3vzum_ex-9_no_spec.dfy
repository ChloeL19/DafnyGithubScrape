// Exercise 9. What happens if you remove the precondition a != null? Change the definition of sorted so that it allows its argument to be null but returns false if it is.


predicate sorted(a: array<int>)
{
   forall j, k :: 0 <= j < k < a.Length ==> a[j] < a[k]
}
