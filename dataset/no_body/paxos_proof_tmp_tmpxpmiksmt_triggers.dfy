// predicate P(x:int)

// predicate Q(x:int)


lemma M(a: seq<int>, m: map<bool,int>)
  requires 2 <= |a|
  requires false in m && true in m
{/* TODO */ }
