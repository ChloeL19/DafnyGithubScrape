module Permutation
{
	/**
	 * Given n >= 0, generate a permuation of {0,...,n-1} nondeterministically.
	 */
	method Generate(n: int) returns (perm: array<int>)
	{
		var all := set x | 0 <= x < n;
		var used := {};
		perm := new int[n];

		CardinalityLemma(n, all);

		while used < all
		{
			CardinalityOrderingLemma(used, all);

			var dst :| dst in all && dst !in used;
			perm[|used|] := dst;
			used := used + {dst};
		}
		print perm;
	}

	predicate isValid(a: array<int>, n: nat)
	{
		assume forall i | 0 <= i < n :: i in a[..];
		distinct(a)
		&& (forall i | 0 <= i < a.Length :: 0 <= a[i] < n)
		&& (forall i | 0 <= i < n :: i in a[..])
	}

	predicate distinct(a: array<int>)
	{
		distinct'(a, a.Length)
	}

	predicate distinct'(a: array<int>, n: int)
	{
		forall i,j | 0 <= i < n && 0 <= j < n && i != j :: a[i] != a[j]
	}

	lemma CardinalityLemma (size: int, s: set<int>)
	{
		if(size == 0) {
		} else {
			CardinalityLemma(size - 1, s - {size - 1});
		}
	}

	lemma CardinalityOrderingLemma<T> (s1: set<T>, s2: set<T>)
	{
		var e :| e in s2 - s1;
		if s1 != s2 - {e} {
			CardinalityOrderingLemma(s1, s2 - {e});
		}
	}

	lemma SetDiffLemma<T> (s1: set<T>, s2: set<T>)
	{
		var e :| e in s2 - s1;
		if s2 - s1 != {e} {} // What does Dafny prove here???
	}
}
