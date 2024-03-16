// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function SeqRepeat<T>(count:nat, elt:T) : seq<T>
{
    ghost var s := SeqRepeat(1, Nothing);
    ghost var e := C(s);
}




