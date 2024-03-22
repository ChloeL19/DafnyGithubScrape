ghost method M1()
{/* TODO */ }

lemma IntersectionIsSubsetOfBoth(A: set, B: set, C: set)
	requires C == A*B
	ensures C <= A && C <= B
{/* TODO */ }

lemma BothSetsAreSubsetsOfTheirUnion(A: set, B: set, C: set)
	requires C == A+B
	ensures A <= C && B <= C
{/* TODO */ }

const s0 := {3,8,1}
//var s2 := {4,5}

lemma M2()
{/* TODO */ }

lemma TheEmptySetIsASubsetOfAnySet(A: set, B: set)
	requires A == {/* TODO */ }
	ensures A <= B // same as writing: B >= A
{}

lemma AnySetIsASubsetOfItself(A: set)
	ensures A <= A
{/* TODO */ }

lemma TheIntersectionOfTwoSetsIsASubsetOfTheirUnion(A: set, B: set, C: set, D: set)
	requires C == A*B && D == A+B
	ensures C <= D
{/* TODO */ }

