function f(x: int): int

lemma {:axiom} f_positive(x: int)
  requires x >= 0
  ensures f(x) >= 0

lemma f_2_pos()
  ensures f(2) >= 0
{/* TODO */ }

lemma f_1_1_pos()
  ensures f(1 + 1) >= 0
{/* TODO */ }

