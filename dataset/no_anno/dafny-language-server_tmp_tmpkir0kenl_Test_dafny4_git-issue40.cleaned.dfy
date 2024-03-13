// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function SeqRepeat<T>(count:nat, elt:T) : seq<T>
lemma test()
{
    ghost var s := SeqRepeat(1, Nothing);
    ghost var e := C(s);
    assert e == C(SeqRepeat(1, Nothing));
}




