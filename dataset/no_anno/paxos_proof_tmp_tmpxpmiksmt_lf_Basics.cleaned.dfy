lemma andb_eq_orb() 
{
    forall b, c | true
    ensures (b && c) == (b || c) ==> b == c
    {}
}

lemma mul_comm()
{}
