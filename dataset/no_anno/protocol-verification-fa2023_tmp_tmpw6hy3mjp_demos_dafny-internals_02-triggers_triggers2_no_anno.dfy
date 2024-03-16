function f(x: int): int

function ff(x: int): int

lemma {:axiom} ff_eq()
lemma {:axiom} ff_eq2()
lemma {:axiom} ff_eq_bad()
  // dafny ignores this trigger because it's an obvious loop
{
  ff_eq();
}

lemma use_ff2(x: int)
{
  ff_eq2();
}

