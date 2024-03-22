predicate positive(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}


method mpositive(v:array<int>) returns (b:bool)
ensures b==positive(v[0..v.Length])
{/* TODO */ }

method mpositive3(v:array<int>) returns (b:bool)
ensures b==positive(v[0..v.Length])
{/* TODO */ }

method mpositive4(v:array<int>) returns (b:bool)
ensures b==positive(v[0..v.Length])
{/* TODO */ }

method mpositivertl(v:array<int>) returns (b:bool)
ensures b==positive(v[0..v.Length])
{/* TODO */ }



