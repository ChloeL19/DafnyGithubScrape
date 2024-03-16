// verifies
function expo(x:int, n:nat): int
{
    if (n == 0) then 1
    else x * expo(x, n - 1)
}

lemma {:induction false} Expon23(n: nat)
{
    if (n == 0) { 
    } else if (n == 1) {
    } else {
        var i:nat := n;
        var j:nat := n;
        // assume true for n
        // prove for n - 1
        Expon23(n - 1);
        //assert expo(2, 2 + 3) == expo(2, 2) * expo(2, 3);
        //assert expo(2, i - 2) == expo(2, i) / expo(2, 2);
        //assert expo(2, i - 3) == expo(2, i) / expo(2, 3); // training
    }
}

method check() {
}
