method quickSort(intSeq:array<int>)
lemma sort(prevSeq:seq<int>) returns (curSeq:seq<int>)
predicate post_sort(prevSeq:seq<int>, curSeq:seq<int>)
{
    && (forall i:nat, j:nat | 0 <= i <= j < |curSeq| :: curSeq[i] <= curSeq[j])
    && multiset(prevSeq) == multiset(curSeq)
}

lemma multisetAdditivity(m1:multiset<int>, m2:multiset<int>, m3:multiset<int>, m4:multiset<int>)
    {
        assert m3 == m1 - m2;
        assert m4 == m1 - m2;
    }


lemma twoSortedSequencesWithSameElementsAreEqual(s1:seq<int>, s2:seq<int>)
{
    if (|s1| != 0) {
        if s1[|s1|-1] == s2[|s2|-1] {
        assert multiset(s1[..|s1|-1]) == multiset(s2[..|s2|-1]) by {
            assert s1 == s1[..|s1|-1] + [s1[|s1|-1]];
            assert multiset(s1) == multiset(s1[..|s1|-1]) + multiset([s1[|s1|-1]]);

            assert s2 == s2[..|s1|-1] + [s2[|s1|-1]];
            assert multiset(s2) == multiset(s2[..|s1|-1]) + multiset([s2[|s1|-1]]);

            assert multiset([s1[|s1|-1]]) == multiset([s2[|s1|-1]]);

            multisetAdditivity(multiset(s1), multiset([s1[|s1|-1]]), multiset(s1[..|s1|-1]), multiset(s2[..|s1|-1]));
        }
        twoSortedSequencesWithSameElementsAreEqual(s1[..|s1|-1], s2[..|s2|-1]);
        } else if s1[|s1|-1] < s2[|s2|-1] {
            assert s2[|s2|-1] !in multiset(s1);
            assert false;
        } else {
            assert s1[|s1|-1] !in multiset(s2);
            assert false;
        }
    }
}

lemma sort_determinisitc(prevSeq:seq<int>, curSeq:seq<int>, curSeq':seq<int>)
{
    
    if (|curSeq| != |curSeq'|) {
        assert |multiset(curSeq)| != |multiset(curSeq')|;
    } else {
        twoSortedSequencesWithSameElementsAreEqual(curSeq, curSeq');
    }
}

lemma sort_determinisitc1(prevSeq:seq<int>, curSeq:seq<int>, curSeq':seq<int>)
{
}
 




