function f(x: int): int
lemma {:axiom} f_positive(x: int)
lemma {:axiom} f_positive(x: int)
  requires x >= 0
  ensures f(x) >= 0

lemma f_2_pos()
{
  f_positive(2);
}

lemma f_1_1_pos()
{
  f_2_pos();
  assert 1 + 1 == 2;
}

