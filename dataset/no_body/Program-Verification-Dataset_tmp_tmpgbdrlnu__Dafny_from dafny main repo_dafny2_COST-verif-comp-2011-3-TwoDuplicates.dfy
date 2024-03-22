// RUN: %testDafnyForEachResolver "%s" -- --warn-deprecation:false


/*
Rustan Leino, 5 Oct 2011

COST Verification Competition, Challenge 3: Two equal elements
http://foveoos2011.cost-ic0701.org/verification-competition

Given: An integer array a of length n+2 with n>=2. It is known that at
least two values stored in the array appear twice (i.e., there are at
least two duplets).

Implement and verify a program finding such two values.

You may assume that the array contains values between 0 and n-1.
*/

// Remarks:

// The implementation of method 'Search' takes one pass through the elements of
// the given array.  To keep track of what it has seen, it allocates an array as
// temporary storage--I imagine that this is what the competition designers
// had in mind, since the problem description says one can assume the values
// of the given array to lie in the range 0..n.

// To keep track of whether it already has found one duplicate, the method
// sets the output variables p and q as follows:
//   p != q   - no duplicates found yet
//   p == q   - one duplicate found so far, namely the value stored in p and q
// Note, the loop invariant does not need to say anything about the state
// of two duplicates having been found, because when the second duplicate is
// found, the method returns.

// What needs to be human-trusted about this program is the specification of
// 'Search'.  The specification straightforwardly lists the assumptions stated
// in the problem description, including the given fact that the array contains
// (at least) two distinct elements that each occurs (at least) twice.  To
// trust the specification of 'Search', a human also needs to trust the definition
// of 'IsDuplicate' and its auxiliary function 'IsPrefixDuplicate'.

// About Dafny:
// As always (when it is successful), Dafny verifies that the program does not
// cause any run-time errors (like array index bounds errors), that the program
// terminates, that expressions and functions are well defined, and that all
// specifications are satisfied.  The language prevents type errors by being type
// safe, prevents dangling pointers by not having an "address-of" or "deallocate"
// operation (which is accommodated at run time by a garbage collector), and
// prevents arithmetic overflow errors by using mathematical integers (which
// is accommodated at run time by using BigNum's).  By proving that programs
// terminate, Dafny proves that a program's time usage is finite, which implies
// that the program's space usage is finite too.  However, executing the
// program may fall short of your hopes if you don't have enough time or
// space; that is, the program may run out of space or may fail to terminate in
// your lifetime, because Dafny does not prove that the time or space needed by
// the program matches your execution environment.  The only input fed to
// the Dafny verifier/compiler is the program text below; Dafny then automatically
// verifies and compiles the program (for this program in less than 11 seconds)
// without further human intervention.

ghost predicate IsDuplicate(a: array<int>, p: int)
  reads a
{/* TODO */ }

ghost predicate IsPrefixDuplicate(a: array<int>, k: int, p: int)
  requires 0 <= k <= a.Length;
  reads a;
{
  exists i,j :: 0 <= i < j < k && a[i] == a[j] == p
}

method Search(a: array<int>) returns (p: int, q: int)
  requires 4 <= a.Length;
  requires exists p,q :: p != q && IsDuplicate(a, p) && IsDuplicate(a, q);  // two distinct duplicates exist
  requires forall i :: 0 <= i < a.Length ==> 0 <= a[i] < a.Length - 2;  // the elements of "a" in the range [0.. a.Length-2]
  ensures p != q && IsDuplicate(a, p) && IsDuplicate(a, q);
{/* TODO */ }

