function f(x: int): int

lemma {:axiom} fLinear(x: int, y: int)
lemma {:axiom} fAntiSymm(x: int)
{
  forall x, y
  {
    fLinear(x, y);
  }
}

lemma fAntiSymm_auto()
{
  forall x
  {
    fAntiSymm(x);
  }
}

lemma UseTriggerBasic(x: int, y: int)
{
  fLinear_auto();
  fAntiSymm_auto();
}

lemma TriggerNotEnough()
{
  // fLinear_auto();
  fAntiSymm_auto();
  fAntiSymm(0);
}

