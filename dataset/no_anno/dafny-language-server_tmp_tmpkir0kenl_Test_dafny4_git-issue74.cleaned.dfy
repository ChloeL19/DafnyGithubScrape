// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function{:opaque} f(x:int):int { x }
function{:opaque} f(x:int):int { x }

lemma L()
{
    forall x:int
        ensures f(x) == x
    {
        reveal f();
    }
    assert forall x:int :: f(x) == x;
}


