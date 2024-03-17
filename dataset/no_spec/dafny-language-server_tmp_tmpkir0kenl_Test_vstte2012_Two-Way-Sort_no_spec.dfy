// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This method is a slight generalization of the
// code provided in the problem statement since it
// is generic in the type of the array elements.
method swap<T>(a: array<T>, i: int, j: int)
{
  var t := a[i];
  a[i] := a[j];
  a[j] := t;
}

// This method is a direct translation of the pseudo
// code given in the problem statement.
// The first postcondition expresses that the resulting
// array is sorted, that is, all occurrences of "false"
// come before all occurrences of "true".
// The second postcondition expresses that the post-state
// array is a permutation of the pre-state array. To express
// this, we use Dafny's built-in multisets. The built-in
// function "multiset" takes an array and yields the
// multiset of the array elements.
// Note that Dafny guesses a suitable ranking function
// for the termination proof of the while loop.
// We use the loop guard from the given pseudo-code.  However,
// the program also verifies with the stronger guard "i < j"
// (without changing any of the other specifications or
// annotations).
method two_way_sort(a: array<bool>)
{
  var i := 0;
  var j := a.Length - 1;
  while (i <= j)
  {
    if (!a[i]) {
      i := i+1;
    } else if (a[j]) {
      j := j-1;
    } else {
      swap(a, i, j);
      i := i+1;
      j := j-1;
    }
  }
}
