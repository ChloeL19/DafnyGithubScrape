// program verifies
function expo(x:int, n:nat): int
{
    if n == 0 then 1
    else x * expo(x, n-1)
}

lemma {:induction false} Expon23(n: nat)
{   
    // base case
    if (n == 0) {
    }

    else if (n == 1) {
    }
    else {
        Expon23(n-1); // lemma proved for case n-1  
    }
}

        
