//--- INCORRECT IMPL :: INCORRECT SPEC ----

    predicate maxSpec_incorrect(a:int,b:int,c:int) 
    {
        && (a > b ==> c >= a)
        && (b > a ==> c >= b)
    }


    lemma maxT_incorrect(a:int,b:int) returns (c:int)
    {
        if(a > b){
            c := a;
        }else if(b > a){
            c := b;
        }else{
            c := a + 100;
        }
    }

predicate maxSpec_mutat14(a:int,b:int,c:int)
{
    (a > b ==> c == a) && (b > a || c != b)
}

// Mutation that Passes = 14 *
// 	 ==> (a > b ==> c == a) && (b > a || c != b)
lemma instance(a:int,b:int,c:int)
{   
}

lemma instance_test1(a:int,b:int,c:int)
{}

lemma instance_test2(a:int,b:int,c:int)
{}

// my thinking process is divide !mutat cases, and then pick invalid cases

// a > b && c != a
lemma correct_test1(a:int,b:int,c:int)
{}

lemma correct_test2(a:int,b:int,c:int)
{}

lemma correct_test3(a:int,b:int,c:int) // the "bug" case
{}

// c == b <= a
lemma correct_test4(a:int,b:int,c:int)
{}


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
