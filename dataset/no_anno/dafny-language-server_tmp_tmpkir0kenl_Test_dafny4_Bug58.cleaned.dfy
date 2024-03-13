// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function M1(f:map<int, bool>, i:int):bool
function M2(f:map<int, bool>, i:int):bool
{
    M1(map j | j in f :: f[j], i)
}

lemma L(f:map<int, bool>, i:int)
{
    assert f[i];
}