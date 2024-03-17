ghost method M1()
{
//	assert 1 == 2;
	assume 1 == 2;
}

lemma IntersectionIsSubsetOfBoth(A: set, B: set, C: set)
{}

lemma BothSetsAreSubsetsOfTheirUnion(A: set, B: set, C: set)
{}

const s0 := {3,8,1}
//var s2 := {4,5}

lemma M2()
{
	var s1 := {2,4,6,8};
	//s0 := {4,1,2};
	s1 := {};
}

lemma TheEmptySetIsASubsetOfAnySet(A: set, B: set)
{}

lemma AnySetIsASubsetOfItself(A: set)
{}

lemma TheIntersectionOfTwoSetsIsASubsetOfTheirUnion(A: set, B: set, C: set, D: set)
{
}

