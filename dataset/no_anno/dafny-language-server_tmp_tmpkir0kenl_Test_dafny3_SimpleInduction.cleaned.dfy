// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

/*
  The well-known Fibonacci function defined in Dafny.  The postcondition of
  method FibLemma states a property about Fib, and the body of the method is
function Fib(n: nat): nat
{ if n < 2 then n else Fib(n-2) + Fib(n-1) }

lemma FibLemma(n: nat)
{
  if (n < 2) {
  } else {
    FibLemma(n-2);
    FibLemma(n-1);
  }
}

/*
  The 'forall' statement has the effect of applying its body simultaneously
  to all values of the bound variables---in the first example, to all k
  satisfying 0 <= k < n, and in the second example, to all non-negative n.
*/

lemma FibLemma_Alternative(n: nat)
{
  forall k | 0 <= k < n {
    FibLemma_Alternative(k);
  }
}

lemma FibLemma_All()
{
  forall n | 0 <= n {
    FibLemma(n);
  }
}

/*
  A standard inductive definition of a generic List type and a function Append
  that concatenates two lists.  The lemma states that Append is associative,
  and its recursive body gives the inductive proof.

  We omitted the explicit declaration and uses of the List type parameter in
  the signature of the method, since in simple cases like this, Dafny is able
  to fill these in automatically.
  */

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function Append<T>(xs: List<T>, ys: List<T>): List<T>
{
  match xs
  case Nil => ys
  case Cons(x, rest) => Cons(x, Append(rest, ys))
}

// The {:induction false} attribute disables automatic induction tactic,
// so we can make the proof explicit.
lemma {:induction false} AppendIsAssociative(xs: List, ys: List, zs: List)
lemma {:induction false} AppendIsAssociative(xs: List, ys: List, zs: List)
  ensures Append(Append(xs, ys), zs) == Append(xs, Append(ys, zs));
  decreases xs;
{
  match (xs) {
    case Nil =>
    case Cons(x, rest) =>
      AppendIsAssociative(rest, ys, zs);
  }
}

// Here the proof is fully automatic - the body of the method is empty,
// yet still verifies.
lemma AppendIsAssociative_Auto(xs: List, ys: List, zs: List)
{
}

