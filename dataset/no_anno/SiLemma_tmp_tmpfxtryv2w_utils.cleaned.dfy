module Utils {

    lemma AllBelowBoundSize(bound: nat)
    {
        if bound == 0 {
        } else {
            AllBelowBoundSize(bound-1);
            var belowminus := set n : nat | n < bound-1 :: n;
            var below := set n : nat | n < bound :: n;
            assert below == belowminus + {bound-1};
        }
    }

    lemma SizeOfContainedSet(a: set<nat>, b: set<nat>)
    {
        if |a| == 0 {
        } else {
            var y :| y in a;
            var new_a := a - {y};
            var new_b := b - {y};
            SizeOfContainedSet(new_a, new_b);
        }
    }

    lemma BoundedSetSize(bound: nat, values: set<nat>)
    {
        var all_below_bound := set n : nat | n < bound :: n;
        AllBelowBoundSize(bound);
        assert |all_below_bound| == bound;
        assert forall n :: n in values ==> n in all_below_bound;
        SizeOfContainedSet(values, all_below_bound);
    }

    lemma MappedSetSize<T, U>(s: set<T>, f: T->U, t: set<U>)
    {
        var t := set n | n in s :: f(n);
        if |s| == 0 {
        } else {
            var y :| y in s;
            var new_s := s - {y};
            var new_t := t - {f(y)};
            assert new_t == set n | n in new_s :: f(n);
            MappedSetSize(new_s, f, new_t);
        }
    }

    lemma SetSizes<T>(a: set<T>, b: set<T>, c: set<T>)
    {
    }

}
