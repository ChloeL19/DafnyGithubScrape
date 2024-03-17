module correctMaxExample{

    predicate maxSpec(a:int,b:int,c:int)
    {
        c >= a
        && c >= b
        && (c == b || c ==a)
    }

    // lemma isSame_maxSpec()
    // ensures (forall a,b,c :: maxSpec(a,b,c) <==> maxSpec_BASE(a,b,c))
    // {
    // }

    lemma max(a:int,b:int) returns (c:int)
    {
        if(a > b){
            c := a;
        }else{
            c := b;
        }
    }

}
