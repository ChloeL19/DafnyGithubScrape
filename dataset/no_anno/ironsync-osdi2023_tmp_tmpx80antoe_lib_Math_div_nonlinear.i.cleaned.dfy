//- <NuBuild AddDafnyFlag /z3opt:smt.arith.nl=true/>
//- WARNING: In general, you shouldn't need to call these directly.  Try
//- to use the ones in div.i.dfy instead.  They're more full-featured anyway.

module Math__div_nonlinear_i {

// WARNING: Think three times before adding anything to this file!
// Nonlinear verification is highly unstable, so even if it appears to work,
// it may cause problems down the road.  Thus, we want to keep this file as
// small and simple as possible.  Instead of adding code here, try proving
// it in div.i.dfy using the connection to the recursive definition

lemma lemma_div_of_0(d:int)
{ }

lemma lemma_div_by_self(d:int)
{ }

lemma lemma_small_div()
    ensures forall x, d {:trigger x / d} :: 0 <= x < d && d > 0 ==> x / d == 0;
{ }

lemma lemma_mod_of_zero_is_zero(m:int)
{ }

lemma lemma_fundamental_div_mod(x:int, d:int)
{ }

lemma lemma_0_mod_anything()
    ensures forall m:int {:trigger 0 % m} :: m > 0 ==> 0 % m == 0;
{ }

lemma lemma_mod_yourself(m:int)
{ }

lemma lemma_small_mod(x:nat, m:nat)
{ }

lemma lemma_mod_range(x:int, m:int)
{ }

lemma lemma_real_div_gt(x:real, y:real)
{ }

} 

