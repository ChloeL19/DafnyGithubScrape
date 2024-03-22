// RUN: %testDafnyForEachResolver "%s"


ghost predicate IsPrime(n: int)
{
  2 <= n && forall m :: 2 <= m < n ==> n % m != 0 // WISH It would be great to think about the status of modulo as a trigger
}

// The following theorem shows that there is an infinite number of primes
lemma AlwaysMorePrimes(k: int)
  ensures exists p :: k <= p && IsPrime(p)
{/* TODO */ }

// Here is an alternative formulation of the theorem
lemma NoFiniteSetContainsAllPrimes(s: set<int>)
  ensures exists p :: IsPrime(p) && p !in s
{/* TODO */ }

// ------------------------- lemmas and auxiliary definitions

ghost predicate AllPrimes(s: set<int>, bound: int)
{
  // s contains only primes
  (forall x :: x in s ==> IsPrime(x)) &&
  // every prime up to "bound" is included in s
  (forall p :: IsPrime(p) && p <= bound ==> p in s)
}

lemma GetLargerPrime(s: set<int>, bound: int) returns (p: int)
  requires AllPrimes(s, bound)
  ensures bound < p && IsPrime(p)
{/* TODO */ }

ghost function product(s: set<int>): int
{
  if s == {} then 1 else
  var a := PickLargest(s); a * product(s - {a})
}

lemma product_property(s: set<int>)
  requires forall x :: x in s ==> 1 <= x
  ensures 1 <= product(s) && forall x :: x in s ==> x <= product(s)
{/* TODO */ }

lemma ProductPlusOneIsPrime(s: set<int>, q: int)
  requires AllPrimes(s, q) && q == product(s)
  ensures IsPrime(q+1)
{/* TODO */ }

// The following lemma is essentially just associativity and commutativity of multiplication.
// To get this proof through, it is necessary to know that if x!=y and y==Pick...(s), then
// also y==Pick...(s - {/* TODO */ }).  It is for this reason that we use PickLargest, instead of
// picking an arbitrary element from s.
lemma RemoveFactor(x: int, s: set<int>)
  requires x in s
  ensures product(s) == x * product(s - {/* TODO */ })
{
  var y := PickLargest(s);
  if x != y {
    calc {
      product(s);
      y * product(s - {y});
      { RemoveFactor(x, s - {y}); }
      y * x * product(s - {y} - {x});
      x * y * product(s - {y} - {x});
      { assert s - {y} - {x} == s - {x} - {y}; }
      x * y * product(s - {x} - {y});
      /* FIXME: This annotation wasn't needed before the introduction
       * of auto-triggers. It's not needed if one adds {:no_trigger}
       * to the forall y :: y in s ==> y <= x part of PickLargest, but that
       * boils down to z3 picking $Box(...) as good trigger
       */
      // FIXME: the parens shouldn't be needed around (s - {x})
      { assert y in (s - {x}); }
      { assert y == PickLargest(s - {x}); }
      x * product(s - {x});
    }
  }
}

// This definition is like IsPrime above, except that the quantification is only over primes.
ghost predicate IsPrime_Alt(n: int)
{
  2 <= n && forall m :: 2 <= m < n && IsPrime(m) ==> n % m != 0
}

// To show that n is prime, it suffices to prove that it satisfies the alternate definition
lemma AltPrimeDefinition(n: int)
  requires IsPrime_Alt(n)
  ensures IsPrime(n)
{/* TODO */ }

lemma Composite(c: int) returns (a: int, b: int)
  requires 2 <= c && !IsPrime(c)
  ensures 2 <= a < c && 2 <= b && a * b == c
  ensures IsPrime(a)
{/* TODO */ }

ghost function PickLargest(s: set<int>): int
  requires s != {}
{
  LargestElementExists(s);
  var x :| x in s && forall y :: y in s ==> y <= x;
  x
}

lemma LargestElementExists(s: set<int>)
  requires s != {/* TODO */ }
  ensures exists x :: x in s && forall y :: y in s ==> y <= x
{
  var s' := s;
  while true
    invariant s' != {} && s' <= s
    invariant forall x,y :: x in s' && y in s && y !in s' ==> y <= x
    decreases s'
  {
    var x :| x in s';  // pick something
    if forall y :: y in s' ==> y <= x {
      // good pick
      return;
    } else {
      // constrain the pick further
      var y :| y in s' && x < y;
      s' := set z | z in s && x < z;
      assert y in s';
    }
  }
}

lemma MulPos(a: int, b: int)
  requires 1 <= a && 1 <= b
  ensures a <= a * b
{/* TODO */ }

// This axiom about % is needed.  Unfortunately, Z3 seems incapable of proving it.
lemma MulDivMod(a: nat, b: nat, c: nat, j: nat)
  requires a * b == c && j < a
  ensures (c+j) % a == j

