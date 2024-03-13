module Utils {
  function max(a: int, b: int): int
    ensures max(a, b) >= a
    ensures max(a, b) >= b
    ensures max(a, b) == a || max(a, b) == b
  {
    if a >= b then a else b
  }

  function min(a: int, b: int): int
    ensures min(a, b) <= a
    ensures min(a, b) <= b
    ensures min(a, b) == a || min(a, b) == b
  {
    if a <= b then a else b
  }

  function maps<P,Q> (xs: seq<P>, f:P->Q): seq<Q>
    ensures |xs| == |maps(xs, f)|
    ensures forall i :: 0 <= i < |xs| ==> f(xs[i]) == maps(xs, f)[i]
  {
    if |xs| == 0 then [] else [f(xs[0])] + maps(xs[1..], f)
  }

  function filter<P> (xs: seq<P>, p: P -> bool): seq<P>
    ensures |xs| <= |maps(xs, p)|
    ensures forall i :: 0 <= i < |xs| ==> (p(xs[i]) ==> xs[i] in filter(xs, p))
    ensures forall i :: 0 <= i < |filter(xs,p)| ==> p(filter(xs,p)[i])
  {
    if |xs| == 0 then [] else (if p(xs[0]) then [xs[0]] else []) + filter(xs[1..], p)
  }
}

