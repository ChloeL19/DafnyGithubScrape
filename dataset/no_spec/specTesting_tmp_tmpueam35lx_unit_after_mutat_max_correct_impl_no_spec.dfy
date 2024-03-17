//--- CORRECT IMPL :: INCORRECT SPEC ----

predicate maxSpec_incorrect(a:int,b:int,c:int) 
{
    && (a > b ==> c == a)
    && (b > a ==> c == b)
}

lemma maxT_correct(a:int,b:int) returns (c:int)
{
    if(a > b){
        c := a;
    }else{
        c := b;
    }
}

predicate maxSpec_mutat1(a:int,b:int,c:int)
{
    (a > b ==> c == a) && (b > a - 1 ==> c == b)
}

predicate maxSpec_mutat2(a:int,b:int,c:int)
{
    (a > b ==> c == a) && (b > c ==> c == b)
}

predicate maxSpec_mutat3(a:int,b:int,c:int)
{
    (a > c ==> c == a) && (b > a ==> c == b)
}



// mathematica:
// original = Implies[a > b, c == a] && Implies[b > a, c == b]
// mutat = Implies[a > b, c == a] && Implies[b > a - 1, c == b]
// original && ! mutat
// Assuming[
//  a \[Element] Integers && b \[Element] Integers && 
//   c \[Element] Integers, Simplify[original && ! mutat]]
// FindInstance[b != c && a == b, {a, b, c}, Integers, 100]


// Mutation that Passes = 4
// 	 ==> (a > b ==> c == a) && (b > a - 1 ==> c == b)
lemma instance1(a:int, b:int, c:int) // not a test actually
{}

lemma instance1_test(a:int, b:int, c:int) // check against (1)
{}

// Mutation that Passes = 8
// 	 ==> (a > b ==> c == a) && (b > c ==> c == b)
lemma instance2(a:int, b:int, c:int)
{}

lemma instance2_test(a:int, b:int, c:int)
{}

lemma correct2_test1(a:int, b:int, c:int)
{}

lemma correct2_test2(a:int, b:int, c:int)
    // anything b > c && c != b
{}

// Mutation that Passes = 37 *
//	 ==> (a > c ==> c == a) && (b > a ==> c == b)
lemma instance3(a:int, b:int, c:int)
{}

lemma instance3_inverse(a:int, b:int, c:int)
{}

lemma instance3_test(a:int, b:int, c:int)
{}

// a > c
lemma correctness3_test1(a:int, b:int, c:int)
{}

lemma correctness3_test2(a:int, b:int, c:int)
{}

lemma correctness3_test3(a:int, b:int, c:int)
{}

lemma correctness3_test4(a:int, b:int, c:int)
{}

lemma correctness3_test5(a:int, b:int, c:int)
{}

// b > a && c != b
lemma correctness3_test6(a:int, b:int, c:int)
{}
lemma correctness3_test7(a:int, b:int, c:int)
{}
lemma correctness3_test8(a:int, b:int, c:int)
{}

lemma correctness3_test9(a:int, b:int, c:int)
{}


// -- Mutations -- TOTAL  == 80 :: Alive == 12
/*
Mutation that Passes = 4
	 ==> (a > b ==> c == a) && (b > a - 1 ==> c == b)
Mutation that Passes = 8
	 ==> (a > b ==> c == a) && (b > c ==> c == b)
Mutation that Passes = 27
	 ==> (a > b ==> c == a) && (b == a ==> c == b)
Mutation that Passes = 29
	 ==> (a > b - 1 ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 32
	 ==> (a + 1 > b ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 36
	 ==> (a > b ==> c == a) && (c > a ==> c == b)
Mutation that Passes = 37 *
	 ==> (a > c ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 51
	 ==> (c > b ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 52
	 ==> (a > b ==> c == a) && (b + 1 > a ==> c == b)
Mutation that Passes = 63
	 ==> (a == b ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 71
	 ==> (a > b ==> c == a) && (!(b < a) ==> c == b)
Mutation that Passes = 78
	 ==> (!(a < b) ==> c == a) && (b > a ==> c == b)
*/


