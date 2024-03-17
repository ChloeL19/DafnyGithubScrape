lemma max(a:int, b:int) returns (m:int)
{
    if (a > b) {
        m := a;
    } else {
        m := b;
    }
}

predicate post_max(a:int, b:int, m:int)
{
    && m >= a
    && m >= b
    && (m == a || m == b)
}

// to check if it is functioning: postcondition not too accommodating
// the case it will refuse
lemma post_max_point_1(a:int, b:int, m:int)
{}

// an equivalent way of doing so
lemma post_max_point_1'(a:int, b:int, m:int)
{}

lemma post_max_point_2(a:int, b:int, m:int)
{}

lemma post_max_point_3(a:int, b:int, m:int)
{}

lemma post_max_vertical_1(a:int, b:int, m:int)
{}

lemma post_max_vertical_1'(a:int, b:int, m:int)
{}

// to check if it is implementable
lemma post_max_realistic_1(a:int, b:int, m:int)
{}

lemma post_max_realistic_2(a:int, b:int, m:int)
{}

lemma post_max_realistic_3(a:int, b:int, m:int)
{}


// this form is more natural
lemma max_deterministic(a:int, b:int, m:int, m':int)
    // should include preconditions if applicable
{}

lemma max_deterministic'(a:int, b:int, m:int, m':int)
{}



lemma lemmaInvTheProposerOfAnyValidBlockInAnHonestBlockchailnIsInTheSetOfValidatorsHelper6Helper<T>(
        s: seq<int>,
        b: int,
        i: nat
    )
    {  }

lemma multisetEquality(m1:multiset<int>, m2:multiset<int>, m3:multiset<int>, m4:multiset<int>)
{
}

