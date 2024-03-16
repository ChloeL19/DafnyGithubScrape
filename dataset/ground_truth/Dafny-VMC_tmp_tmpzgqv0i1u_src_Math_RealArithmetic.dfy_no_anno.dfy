/*******************************************************************************
 *  Copyright by the contributors to the Dafny Project
 *  SPDX-License-Identifier: MIT
 *******************************************************************************/

module RealArith {
  function Abs(r: real): real {
    if r >= 0.0 then r else -r
  }

  function Max(x: real, y: real): real {
    if x >= y then x else y
  }

  function Min(x: real, y: real): real {
    if x <= y then x else y
  }

  function Dist(x: real, y: real): real {
    Abs(x - y)
  }

  lemma TriangleInequality(a: real, b: real, c: real)
  {}

  lemma AbsMul(x: real, y: real)
  {}

  lemma MulMonotonicStrict(factor: real, x: real, y: real)
  {}

  lemma MulMonotonic(factor: real, x: real, y: real)
  {}

  lemma DivMulEqualsMulDiv(a: real, b: real, c: real)
  {}

  lemma DivMulEqualsDivDiv(a: real, b: real, c: real)
  {}

  lemma DivMulEqualsDivDiv2(a: real, b: real, c: real)
  {}

  lemma AbsDiv(a: real, b: real)
  {
    if a >= 0.0 {}
  }

  lemma MultiplicationCancelMonotonic(factor:real, x: real, y: real)
  {}

  lemma DivisionIsMonotonic(a: real, b: real, c: real)
  {}

  lemma DivisionIsMonotonicStrict(a: real, b: real, c: real)
  {}

  lemma DivisionIsAntiMonotonic(a: real, b: real, c: real)
  {}

  lemma DivisionIsAntiMonotonicStrict(a: real, b: real, c: real)
  {}
}

