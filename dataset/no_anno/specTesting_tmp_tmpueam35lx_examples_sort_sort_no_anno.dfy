method quickSort(intSeq:array<int>)
{
    && (forall i:nat, j:nat | 0 <= i <= j < |curSeq| :: curSeq[i] <= curSeq[j])
    && multiset(prevSeq) == multiset(curSeq)
}

lemma multisetAdditivity(m1:multiset<int>, m2:multiset<int>, m3:multiset<int>, m4:multiset<int>)
    {
    }


lemma twoSortedSequencesWithSameElementsAreEqual(s1:seq<int>, s2:seq<int>)
{
    if (|s1| != 0) {
        if s1[|s1|-1] == s2[|s2|-1] {
            multisetAdditivity(multiset(s1), multiset([s1[|s1|-1]]), multiset(s1[..|s1|-1]), multiset(s2[..|s1|-1]));
        }
        twoSortedSequencesWithSameElementsAreEqual(s1[..|s1|-1], s2[..|s2|-1]);
        } else if s1[|s1|-1] < s2[|s2|-1] {
        } else {
        }
    }
}

lemma sort_determinisitc(prevSeq:seq<int>, curSeq:seq<int>, curSeq':seq<int>)
{
    
    if (|curSeq| != |curSeq'|) {
    } else {
        twoSortedSequencesWithSameElementsAreEqual(curSeq, curSeq');
    }
}

lemma sort_determinisitc1(prevSeq:seq<int>, curSeq:seq<int>, curSeq':seq<int>)
{
}
 




