lemma andb_eq_orb() 
    ensures forall b, c :: (b && c) == (b || c) ==> b == c;
{/* TODO */ }

lemma mul_comm()
    ensures forall m, n : nat :: m * n == n * m;
{/* TODO */ }
