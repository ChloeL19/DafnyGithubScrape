// RUN: %dafny /compile:0 /noNLarith  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function power(n:nat, e:nat) : int

lemma lemma_power()
{
    forall n:nat, e:nat
    {
        assume false;
    }
}

