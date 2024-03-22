//--- INCORRECT IMPL :: INCORRECT SPEC ----

    predicate maxSpec_incorrect(a:int,b:int,c:int) 
    {
        && (a > b ==> c >= a)
        && (b > a ==> c >= b)
    }


    lemma maxT_incorrect(a:int,b:int) returns (c:int)
        ensures maxSpec_incorrect(a,b,c)
    {/* TODO */ }

predicate maxSpec_mutat14(a:int,b:int,c:int)
{
    (a > b ==> c == a) && (b > a || c != b)
}

// Mutation that Passes = 14 *
// 	 ==> (a > b ==> c == a) && (b > a || c != b)
lemma instance(a:int,b:int,c:int)
    requires (a==b==c) || (b < a < c)
    ensures maxSpec_incorrect(a,b,c)
    ensures !maxSpec_mutat14(a,b,c)
{/* TODO */ }

lemma instance_test1(a:int,b:int,c:int)
    requires a == b == c == 1 // valid input
    ensures maxSpec_incorrect(a,b,c)
    ensures !maxSpec_mutat14(a,b,c)
{/* TODO */ }

lemma instance_test2(a:int,b:int,c:int)
    requires b == 1 && a == 2 && c == 3 // invalid input
    ensures maxSpec_incorrect(a,b,c)
    ensures !maxSpec_mutat14(a,b,c)
{/* TODO */ }

// my thinking process is divide !mutat cases, and then pick invalid cases

// a > b && c != a
lemma correct_test1(a:int,b:int,c:int)
    requires b == 1 && a == 3 && c == 0
    ensures !maxSpec_mutat14(a,b,c)
    // ensures maxSpec_incorrect(a,b,c)
{/* TODO */ }

lemma correct_test2(a:int,b:int,c:int)
    requires b == 1 && a == 3 && c == 2
    ensures !maxSpec_mutat14(a,b,c)
    // ensures maxSpec_incorrect(a,b,c)
{/* TODO */ }

lemma correct_test3(a:int,b:int,c:int) // the "bug" case
    requires b == 1 && a == 3 && c == 4
    ensures !maxSpec_mutat14(a,b,c)
    ensures maxSpec_incorrect(a,b,c)
{/* TODO */ }

// c == b <= a
lemma correct_test4(a:int,b:int,c:int)
    requires b == c == 1 && a == 2
    ensures !maxSpec_mutat14(a,b,c)
    // ensures maxSpec_incorrect(a,b,c)
{/* TODO */ }


// -- Mutations -- TOTAL  == 80 :: Alive == 4
/*
Mutation that Passes = 14 *
	 ==> (a > b ==> c == a) && (b > a || c != b)
Mutation that Passes = 18 equivalent to 14
	 ==> (a > b || c != a) && (b > a ==> c == b)
Mutation that Passes = 44
	 ==> (a > c ==> c == a) && (b > a ==> c == b)
Mutation that Passes = 47
	 ==> (a > b ==> c == a) && (b > c ==> c == b)
*/
