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

predicate maxSpec_mutat3(a:int,b:int,c:int)
{
    (a > c ==> c == a) && (b > a ==> c == b)
}

// Mutation that Passes = 37 *
//	 ==> (a > c ==> c == a) && (b > a ==> c == b)

// * The following two lemmas are to prove {original} - {mutat} is a == b > c
lemma instance3(a:int, b:int, c:int)
{}

lemma instance3_inverse(a:int, b:int, c:int)
{}

// * The "instance" manually fuzzed from {original} - {mutat}
lemma instance3_test(a:int, b:int, c:int)
{}

// It does not make sense to compare the efficiency of those two methods!
// One is fuzzing, the other is testing
// I think it makes more sense to compare those methods with their counterpart without alive mutations

// * The correctness style test: finding instances that are both invalid and not in {mutat}
// thinking process in finding the instances:
    // 1. divide !mutat into different cases and give a specific instance from each cases
        // a > c, and b's relative magnitude with a and c
        // b > a && c != b, and c's relative magnitude with a and b
    // 2. judge each of them is valid/invalid
    // 3. if it is invalid, write a test for it
// But 1 is essentially a "more structured" fuzzing step on !mutat
// whose space is much broader than {original} - {mutat}
// it is easier to do this "more structured" fuzzing on {original} - {mutat}


// an alternative thinking process in finding the instances:
    // 1. divide all invalid cases I can think of:
        // a == b, c < a | a == b, c > a | a == b, c ==a
        // a < b, c != b ==> c == ...
        // a > b, c != a ==> c == ...
    // 2. judge each of them is !mutat
    // 3. if it is !mutat, write a test for it
// But 1 is essentially a "more structured" way of writing correctness tests without alive mutations
// and after this point, it is more effective and easier to "judge" whether they are in {original}
// which is just what we would do in writing a correctness test
// We are not taking advantage of alive mutations in this case

// other thinking process is the same as finding a counterexample directly
// if someone can do this, it would be easier or more focused to finding counterexample for all of 
    // invalid, {original}, and !{mutat}

// * writing tests using the first "thinking process" for correctness tests
// a > c: it happens that in this case all cases are invalid
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

// b > a && c != b: it also happens that in this case all cases are invalid
lemma correctness3_test6(a:int, b:int, c:int)
{}
lemma correctness3_test7(a:int, b:int, c:int)
{}
lemma correctness3_test8(a:int, b:int, c:int)
{}

lemma correctness3_test9(a:int, b:int, c:int)
{}

// * writing tests using the alternative "thinking process" for correctness tests
// (a > c ==> c == a) && (b > a ==> c == b)
lemma correctness3'_test1(a:int, b:int, c:int)
{}

lemma correctness3'_test2(a:int, b:int, c:int)
{}

lemma correctness3'_test3(a:int, b:int, c:int)
{}

lemma correctness3'_test4(a:int, b:int, c:int)
{}

lemma correctness3'_test5(a:int, b:int, c:int)
{}

lemma correctness3'_test6(a:int, b:int, c:int)
{}

lemma correctness3'_test7(a:int, b:int, c:int)
{}
