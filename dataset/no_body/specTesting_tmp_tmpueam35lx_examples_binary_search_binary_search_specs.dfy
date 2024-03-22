lemma BinarySearch(intSeq:seq<int>, key:int) returns (r:int)
    // original
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures r >= 0 ==> r < |intSeq| && intSeq[r] == key
    ensures r < 0 ==> forall i:nat | i < |intSeq| :: intSeq[i] != key
{/* TODO */ }

predicate BinarySearchTransition(intSeq:seq<int>, key:int, r:int)
    requires (forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j])
{
    && (r >= 0 ==> r < |intSeq| && intSeq[r] == key)
    && (r < 0 ==> forall i:nat | i < |intSeq| :: intSeq[i] != key)
}

lemma BinarySearchDeterministic(intSeq:seq<int>, key:int) returns (r:int)
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures r >= 0 ==> r < |intSeq| && intSeq[r] == key
    ensures r < 0 ==> forall i:nat | i < |intSeq| :: intSeq[i] != key

    // make it deterministic
    ensures r < 0 ==> r == -1 // return -1 if not found
    ensures r >= 0 ==> forall i:nat | i < r :: intSeq[i] < key // multiple matches return the first result

{/* TODO */ }

predicate BinarySearchDeterministicTransition(intSeq:seq<int>, key:int, r:int)
    requires (forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j])
{
    && (r >= 0 ==> r < |intSeq| && intSeq[r] == key)
    && (r < 0 ==> forall i:nat | i < |intSeq| :: intSeq[i] != key)

    // make it deterministic
    && (r < 0 ==> r == -1) // return -1 if not found
    && (r >= 0 ==> forall i:nat | i < r :: intSeq[i] < key)
}

lemma BinarySearchWrong1(intSeq:seq<int>, key:int) returns (r:int)
    // first element
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures r >= 0 ==> r < |intSeq| && intSeq[r] == key
    ensures r < 0 ==> forall i:nat | 0 < i < |intSeq| :: intSeq[i] != key // i >= 0

    // make it deterministic
    ensures r < 0 ==> r == -1 // return -1 if not found
    ensures r >= 0 ==> forall i:nat | i < r :: intSeq[i] < key // multiple matches return the first result

predicate BinarySearchWrong1Transition(intSeq:seq<int>, key:int, r:int)
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
{/* TODO */ }

lemma BinarySearchWrong2(intSeq:seq<int>, key:int) returns (r:int)
    // last element
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures r >= 0 ==> r < |intSeq| && intSeq[r] == key
    ensures r < 0 ==> forall i:nat | 0 <= i < |intSeq| - 1 :: intSeq[i] != key // i < |intSeq|

    // make it deterministic
    ensures r < 0 ==> r == -1 // return -1 if not found
    ensures r >= 0 ==> forall i:nat | i < r :: intSeq[i] < key // multiple matches return the first result

predicate BinarySearchWrong2Transition(intSeq:seq<int>, key:int, r:int)
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
{/* TODO */ }

lemma BinarySearchWrong3(intSeq:seq<int>, key:int) returns (r:int)
    // weaker spec
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures r < 0 || (r < |intSeq| && intSeq[r] == key) // post condition not correctly formed
{/* TODO */ }

predicate BinarySearchWrong3Transition(intSeq:seq<int>, key:int, r:int)
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
{
    r < 0 || (r < |intSeq| && intSeq[r] == key)
}

lemma BinarySearchWrong4(intSeq:seq<int>, key:int) returns (r:int)
    // non-realistic
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
    ensures 0 <= r < |intSeq| && intSeq[r] == key

predicate BinarySearchWrong4Transition(intSeq:seq<int>, key:int, r:int)
    requires forall i,j | 0 <= i <= j < |intSeq| :: intSeq[i] <= intSeq[j]
{/* TODO */ }

