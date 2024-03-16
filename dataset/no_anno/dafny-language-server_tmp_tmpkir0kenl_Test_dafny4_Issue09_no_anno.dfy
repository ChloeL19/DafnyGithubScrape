// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function Transform(x:int) : int

lemma TransformProperties()
function {:opaque} Looper(input:seq<int>) : seq<int>
{
    if |input| == 0 then []
    else [Transform(input[0])] + Looper(input[1..])
}

lemma proof(s1:seq<int>, s2:seq<int>)
{
    reveal_Looper();
    TransformProperties();
}


