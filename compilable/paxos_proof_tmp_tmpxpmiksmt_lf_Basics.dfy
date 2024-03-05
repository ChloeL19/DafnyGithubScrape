lemma andb_eq_orb() 
    ensures forall b, c :: (b && c) == (b || c) ==> b == c;
{
    forall b, c | true
    ensures (b && c) == (b || c) ==> b == c
    {}
}

lemma mul_comm()
    ensures forall m, n : nat :: m * n == n * m;
{}
