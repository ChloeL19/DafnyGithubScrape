lemma {:induction false} Divby2(n: nat)
{
    if n == 0 {
    } else {
        Divby2(n - 1); // proved in case n - 1
    }
}

