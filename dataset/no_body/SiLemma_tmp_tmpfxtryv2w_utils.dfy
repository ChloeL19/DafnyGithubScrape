module Utils {

    lemma AllBelowBoundSize(bound: nat)
        ensures
            var below := set n : nat | n < bound :: n;
            |below| ==  bound
        decreases bound
    {/* TODO */ }

    lemma SizeOfContainedSet(a: set<nat>, b: set<nat>)
        requires forall n: nat :: n in a ==> n in b
        ensures |a| <= |b|
        decreases |a|
    {/* TODO */ }

    lemma BoundedSetSize(bound: nat, values: set<nat>)
        requires forall n :: n in values ==> n < bound
        ensures |values| <= bound
    {/* TODO */ }

    lemma MappedSetSize<T, U>(s: set<T>, f: T->U, t: set<U>)
        requires forall n: T, m: T :: m != n ==> f(n) != f(m)
        requires t == set n | n in s :: f(n)
        ensures |s| == |t|
        decreases |s|
    {/* TODO */ }

    lemma SetSizes<T>(a: set<T>, b: set<T>, c: set<T>)
        requires c == a + b
        requires forall t: T :: t in a ==> t !in b
        requires forall t: T :: t in b ==> t !in a
        ensures |c| == |a| + |b|
    {/* TODO */ }

}
