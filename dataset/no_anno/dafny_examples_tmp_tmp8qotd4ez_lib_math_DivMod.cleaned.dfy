module DivMod {

  function {:opaque} DivSub(a: int, b: int): int
  function {:opaque} DivSub(a: int, b: int): int
    requires 0 <= a && 0 < b
  {
    if a < b then 0 else 1 + DivSub(a - b, b)
  }

  function {:opaque} ModSub(a: int, b: int): int
  function {:opaque} ModSub(a: int, b: int): int
    requires 0 <= a && 0 < b
  {
    if a < b then a else ModSub(a - b, b)
  }

  lemma DivModAdd1(a: int, b: int)
  {
    var c := (a + b) / b - (a / b) - 1;
    assert c * b + (a + b) % b - a % b == 0;
  }

  lemma DivModSub1(a: int, b: int)
  {
    var c := (a - b) / b - (a / b) + 1;
    assert c * b + (a - b) % b - a % b == 0;
  }

  lemma ModEq(a: int, b: int)
  {
    reveal ModSub();
    if a >= b {
      DivModSub1(a, b);
    }
  }

  lemma DivEq(a: int, b: int)
  {
    reveal DivSub();
    if a >= b {
      DivModSub1(a, b);
    }
  }

  lemma DivModSpec'(a: int, b: int, q: int, r: int)
  {
    reveal ModSub();
    reveal DivSub();
    if q > 0 {
      DivModSpec'(a - b, b, q - 1, r);
    }
  }

  lemma DivModSpec(a: int, b: int, q: int, r: int)
  {
    ModEq(a, b);
    DivEq(a, b);
    DivModSpec'(a, b, q, r);
  }

  lemma DivMul(a: int, b: int)
  {
    DivModSpec(a * b, b, a, 0);
  }

  lemma DivModMulAdd(a: int, b: int, c: int)
  {
    DivModSpec(a * b + c, b, a, c);
  }

}
