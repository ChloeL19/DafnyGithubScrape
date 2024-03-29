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
    ensures Dist(a, c) <= Dist(a, b) + Dist(b, c)
  {}

  lemma AbsMul(x: real, y: real)
    ensures Abs(x * y) == Abs(x) * Abs(y)
  {}

  lemma MulMonotonicStrict(factor: real, x: real, y: real)
    requires x < y
    requires factor > 0.0
    ensures x * factor < y * factor
    ensures factor * x < factor * y
  {}

  lemma MulMonotonic(factor: real, x: real, y: real)
    requires x <= y
    requires factor >= 0.0
    ensures x * factor <= y * factor
    ensures factor * x <= factor * y
  {}

  lemma DivMulEqualsMulDiv(a: real, b: real, c: real)
    requires b != 0.0
    ensures a / b * c == a * c / b
  {}

  lemma DivMulEqualsDivDiv(a: real, b: real, c: real)
    requires b != 0.0
    requires c != 0.0
    ensures a / (b * c) == a / b / c
  {}

  lemma DivMulEqualsDivDiv2(a: real, b: real, c: real)
    requires b != 0.0
    requires c != 0.0
    ensures a / (b / c) == a * c / b
  {}

  lemma AbsDiv(a: real, b: real)
    requires b != 0.0
    ensures Abs(a / b) == Abs(a) / Abs(b)
  {
    if a >= 0.0 {}
  }

  lemma MultiplicationCancelMonotonic(factor:real, x: real, y: real)
    requires factor > 0.0
    ensures x * factor <= y * factor ==> x <= y
  {}

  lemma DivisionIsMonotonic(a: real, b: real, c: real)
    requires c > 0.0
    requires a <= b
    ensures a / c <= b / c
  {}

  lemma DivisionIsMonotonicStrict(a: real, b: real, c: real)
    requires c > 0.0
    requires a < b
    ensures a / c < b / c
  {}

  lemma DivisionIsAntiMonotonic(a: real, b: real, c: real)
    requires a >= 0.0
    requires b > 0.0
    requires c > 0.0
    requires c <= b
    ensures a / b <= a / c
  {}

  lemma DivisionIsAntiMonotonicStrict(a: real, b: real, c: real)
    requires a > 0.0
    requires b > 0.0
    requires c > 0.0
    ensures (c < b) <==> (a / b < a / c)
  {}
}

