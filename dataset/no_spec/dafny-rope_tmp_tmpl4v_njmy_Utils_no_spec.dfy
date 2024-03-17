module Utils {
  function max(a: int, b: int): int
  {
    if a >= b then a else b
  }

  function min(a: int, b: int): int
  {
    if a <= b then a else b
  }

  function maps<P,Q> (xs: seq<P>, f:P->Q): seq<Q>
  {
    if |xs| == 0 then [] else [f(xs[0])] + maps(xs[1..], f)
  }

  function filter<P> (xs: seq<P>, p: P -> bool): seq<P>
  {
    if |xs| == 0 then [] else (if p(xs[0]) then [xs[0]] else []) + filter(xs[1..], p)
  }
}

