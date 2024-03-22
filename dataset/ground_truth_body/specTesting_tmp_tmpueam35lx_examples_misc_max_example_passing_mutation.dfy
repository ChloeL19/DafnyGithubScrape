module maxExample{

    predicate maxSpec(a:int,b:int,c:int)
    {
        c >= a
        && c >= b
    }

    lemma max(a:int,b:int) returns (c:int)
        ensures maxSpec(a,b,c)
    {
        if(a > b){
            c := a + 100;
        }else{
            c := b + 100;
        }
    }

    // a mutation
    predicate maxSpecMut1(a:int,b:int,c:int)
    {
        c > a
        && c > b
    }

    // a passing mutation
    lemma maxMut1(a:int,b:int) returns (c:int)
        ensures maxSpecMut1(a,b,c)
    {
        if(a > b){
            c := a + 100;
        }else{
            c := b + 100;
        }
    }

    

}

