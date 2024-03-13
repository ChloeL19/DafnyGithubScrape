//- <NuBuild AddDafnyFlag /z3opt:smt.arith.nl=true/>
//- WARNING: In general, you shouldn't need to call these directly.  Try
//- to use the ones in mul.i.dfy instead.  They're more full-featured anyway.

module Math__mul_nonlinear_i {

// TODO_MODULE: module Math__mul_nonlinear_i {

// WARNING: Think three times before adding anything to this file!
// Nonlinear verification is highly unstable, so even if it appears to work,
// it may cause problems down the road.  Thus, we want to keep this file as
// small and simple as possible.  Instead of adding code here, try proving
// it in div.i.dfy using the connection to the recursive definition

lemma lemma_mul_strictly_positive(x:int, y:int)
{}

lemma lemma_mul_nonzero(x:int, y:int)
{}

lemma lemma_mul_is_associative(x:int, y:int, z:int)
{}

lemma lemma_mul_is_distributive_add(x:int, y:int, z:int)
{}

lemma lemma_mul_ordering(x:int, y:int)
{ }

lemma lemma_mul_strict_inequality(x:int, y:int, z:int)
{}

// TODO_MODULE: } import opened Math__mul_nonlinear_i_ = Math__mul_nonlinear_i

} 
