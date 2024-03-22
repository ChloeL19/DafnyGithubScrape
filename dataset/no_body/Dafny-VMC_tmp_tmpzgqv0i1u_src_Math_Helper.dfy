/*******************************************************************************
 *  Copyright by the contributors to the Dafny Project
 *  SPDX-License-Identifier: MIT
 *******************************************************************************/

module Helper {
  /************
   Definitions
  ************/

  function Power(b: nat, n: nat): (p: nat)
    ensures b > 0 ==> p > 0
  {
    match n
    case 0 => 1
    case 1 => b
    case _ => b * Power(b, n - 1)
  }

  function Log2Floor(n: nat): nat
    requires n >= 1
    decreases n
  {
    if n < 2
    then 0
    else Log2Floor(n / 2) + 1
  }

  lemma Log2FloorDef(n: nat)
    requires n >= 1
    ensures Log2Floor(2 * n) == Log2Floor(n) + 1
  {/* TODO */ }

  function boolToNat(b: bool): nat {
    if b then 1 else 0
  }

  /*******
   Lemmas
  *******/

  lemma Congruence<T, U>(x: T, y: T, f: T -> U)
    requires x == y
    ensures f(x) == f(y)
  {/* TODO */ }

  lemma DivisionSubstituteAlternativeReal(x: real, a: real, b: real)
    requires a == b
    requires x != 0.0
    ensures a / x == b / x
  {/* TODO */ }

  lemma DivModAddDenominator(n: nat, m: nat)
    requires m > 0
    ensures (n + m) / m == n / m + 1
    ensures (n + m) % m == n % m
  {/* TODO */ }

  lemma DivModIsUnique(n: int, m: int, a: int, b: int)
    requires n >= 0
    requires m > 0
    requires 0 <= b < m
    requires n == a * m + b
    ensures a == n / m
    ensures b == n % m
  {/* TODO */ }

  lemma DivModAddMultiple(a: nat, b: nat, c: nat)
    requires a > 0
    ensures (c * a + b) / a == c + b / a
    ensures (c * a + b) % a == b % a
  {/* TODO */ }

  lemma DivisionByTwo(x: real)
    ensures 0.5 * x == x / 2.0
  {/* TODO */ }

  lemma PowerGreater0(base: nat, exponent: nat)
    requires base >= 1
    ensures Power(base, exponent) >= 1
  {/* TODO */ }

  lemma Power2OfLog2Floor(n: nat)
    requires n >= 1
    ensures Power(2, Log2Floor(n)) <= n < Power(2, Log2Floor(n) + 1)
  {/* TODO */ }

  lemma NLtPower2Log2FloorOf2N(n: nat)
    requires n >= 1
    ensures n < Power(2, Log2Floor(2 * n))
  {/* TODO */ }

  lemma MulMonotonic(a: nat, b: nat, c: nat, d: nat)
    requires a <= c
    requires b <= d
    ensures a * b <= c * d
  {/* TODO */ }

  lemma MulMonotonicStrictRhs(b: nat, c: nat, d: nat)
    requires b < d
    requires c > 0
    ensures c * b < c * d
  {/* TODO */ }

  lemma MulMonotonicStrict(a: nat, b: nat, c: nat, d: nat)
    requires a <= c
    requires b <= d
    requires (a != c && d > 0) || (b != d && c > 0)
    ensures a * b < c * d
  {/* TODO */ }

  lemma AdditionOfFractions(x: real, y: real, z: real)
    requires z != 0.0
    ensures (x / z) + (y / z) == (x + y) / z
  {/* TODO */ }

  lemma DivSubstituteDividend(x: real, y: real, z: real)
    requires y != 0.0
    requires x == z
    ensures x / y == z / y
  {/* TODO */ }

  lemma DivSubstituteDivisor(x: real, y: real, z: real)
    requires y != 0.0
    requires y == z
    ensures x / y == x / z
  {/* TODO */ }

  lemma DivDivToDivMul(x: real, y: real, z: real)
    requires y != 0.0
    requires z != 0.0
    ensures (x / y) / z == x / (y * z)
  {/* TODO */ }

  lemma NatMulNatToReal(x: nat, y: nat)
    ensures (x * y) as real == (x as real) * (y as real)
  {/* TODO */ }

  lemma SimplifyFractions(x: real, y: real, z: real)
    requires z != 0.0
    requires y != 0.0
    ensures (x / z) / (y / z) == x / y
  {/* TODO */ }

  lemma PowerOfTwoLemma(k: nat)
    ensures (1.0 / Power(2, k) as real) / 2.0 == 1.0 / (Power(2, k + 1) as real)
  {/* TODO */ }
}

