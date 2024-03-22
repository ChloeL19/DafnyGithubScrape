// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function{:opaque} f(x:int):int { x }

lemma L()
    ensures forall x:int :: f(x) == x
{/* TODO */ }


