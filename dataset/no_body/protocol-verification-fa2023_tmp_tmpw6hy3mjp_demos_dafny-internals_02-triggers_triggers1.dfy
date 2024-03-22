function f(x: int): int

lemma {:axiom} fLinear(x: int, y: int)
  ensures f(x + y) == f(x) + f(y)
lemma {/* TODO */ } fAntiSymm(x: int)
  ensures f(-x) == -f(x)

lemma fLinear_auto()
  ensures forall x, y {/* TODO */ } :: f(x + y) == f(x) + f(y)
{
  forall x, y
    ensures f(x + y) == f(x) + f(y)
  {
    fLinear(x, y);
  }
}

lemma fAntiSymm_auto()
  ensures forall x {/* TODO */ } :: f(-x) == -f(x)
{
  forall x
    ensures f(-x) == -f(x)
  {
    fAntiSymm(x);
  }
}

lemma UseTriggerBasic(x: int, y: int)
  ensures f(x - y) == f(x) - f(y)
{/* TODO */ }

lemma TriggerNotEnough()
  ensures f(0) == 0
{/* TODO */ }

