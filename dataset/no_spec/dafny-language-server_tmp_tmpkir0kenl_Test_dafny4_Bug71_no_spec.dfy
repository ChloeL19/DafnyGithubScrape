// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function{:opaque} MapSetToSet<X(!new), Y>(xs:set<X>, f:X~>Y):set<Y>
//function MapSetToSet<X, Y>(xs:set<X>, f:X->Y):set<Y>
{
  set x | x in xs :: f(x)
}

