/*******************************************************************************
 *  Copyright by the contributors to the Dafny Project
 *  SPDX-License-Identifier: MIT
 *******************************************************************************/

module Helper {
  /************
   Definitions
  ************/

  function Power(b: nat, n: nat): (p: nat)
  {
    match n
    case 0 => 1
    case 1 => b
    case _ => b * Power(b, n - 1)
  }

  function Log2Floor(n: nat): nat
  {
    if n < 2
    then 0
    else Log2Floor(n / 2) + 1
  }

  lemma Log2FloorDef(n: nat)
  {}

  function boolToNat(b: bool): nat {
    if b then 1 else 0
  }

  /*******
   Lemmas
  *******/

  lemma Congruence<T, U>(x: T, y: T, f: T -> U)
  {}

  lemma DivisionSubstituteAlternativeReal(x: real, a: real, b: real)
  {}

  lemma DivModAddDenominator(n: nat, m: nat)
  {
    var zp := (n + m) / m - n / m - 1;
  }

  lemma DivModIsUnique(n: int, m: int, a: int, b: int)
  {
    if a == 0 {
    } else {
    }
  }

  lemma DivModAddMultiple(a: nat, b: nat, c: nat)
  {
    calc {
      a * c + b;
    ==
      a * c + (a * (b / a) + b % a);
    ==
      a * (c + b / a) + b % a;
    }
    DivModIsUnique(a * c + b, a, c + b / a, b % a);
  }

  lemma DivisionByTwo(x: real)
  {}

  lemma PowerGreater0(base: nat, exponent: nat)
  {}

  lemma Power2OfLog2Floor(n: nat)
  {}

  lemma NLtPower2Log2FloorOf2N(n: nat)
  {
    calc {
      n;
    < { Power2OfLog2Floor(n); }
      Power(2, Log2Floor(n) + 1);
    == { Log2FloorDef(n); }
      Power(2, Log2Floor(2 * n));
    }
  }

  lemma MulMonotonic(a: nat, b: nat, c: nat, d: nat)
  {
    calc {
      a * b;
    <=
      c * b;
    <=
      c * d;
    }
  }

  lemma MulMonotonicStrictRhs(b: nat, c: nat, d: nat)
  {}

  lemma MulMonotonicStrict(a: nat, b: nat, c: nat, d: nat)
  {
    if a != c && d > 0 {
      calc {
        a * b;
      <= { MulMonotonic(a, b, a, d); }
        a * d;
      <
        c * d;
      }
    }
    if b != d && c > 0 {
      calc {
        a * b;
      <=
        c * b;
      < { MulMonotonicStrictRhs(b, c, d); }
        c * d;
      }
    }
  }

  lemma AdditionOfFractions(x: real, y: real, z: real)
  {}

  lemma DivSubstituteDividend(x: real, y: real, z: real)
  {}

  lemma DivSubstituteDivisor(x: real, y: real, z: real)
  {}

  lemma DivDivToDivMul(x: real, y: real, z: real)
  {}

  lemma NatMulNatToReal(x: nat, y: nat)
  {}

  lemma SimplifyFractions(x: real, y: real, z: real)
  {}

  lemma PowerOfTwoLemma(k: nat)
  {
    calc {
      (1.0 / Power(2, k) as real) / 2.0;
    == { DivDivToDivMul(1.0, Power(2, k) as real, 2.0); }
      1.0 / (Power(2, k) as real * 2.0);
    == { NatMulNatToReal(Power(2, k), 2); }
      1.0 / (Power(2, k) * 2) as real;
    ==
      1.0 / (Power(2, k + 1) as real);
    }
  }
}

