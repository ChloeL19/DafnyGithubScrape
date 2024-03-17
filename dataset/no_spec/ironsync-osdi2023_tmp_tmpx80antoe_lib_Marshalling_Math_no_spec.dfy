// Based on IronFleet's math library.
// I pulled out only the functions we need for the marshalling code,
// and in a few cases rewrote the proof from scratch to avoid pulling in
// a lot of dependencies.

module Math {
  function {:opaque} power2(exp: nat) : nat
  {
      if (exp==0) then
          1
      else
          2*power2(exp-1)
  }

  lemma lemma_2toX()
  {
    reveal_power2();
  }

  lemma lemma_power2_adds(e1:nat, e2:nat)
  {
    reveal_power2();
    if (e2 == 0) {
    } else {
      lemma_power2_adds(e1, e2-1);
    }
  }

  lemma lemma_2toX32()
  {
    reveal_power2();
  }

  lemma bounded_mul_eq_0(x: int, m: int)
  {
  }

  // This is often used as part of the axiomatic definition of division
  // in a lot of formalizations of mathematics. Oddly, it isn't built-in to dafny
  // and we have to prove it in sort of a roundabout way.
  lemma lemma_div_ind(x: int, d: int)
  {
        == x - (x % d) + d;

        == (x + d) - ((x + d) % d);

        == ((x + d) % d) - (x % d);

    bounded_mul_eq_0((x / d + 1) - ((x + d) / d), d);
  }

  lemma lemma_add_mul_div(a: int, b: int, d: int)
  {
    if (b == 0) {
    } else if (b > 0) {
      lemma_add_mul_div(a, b-1, d);
      lemma_div_ind(a + (b-1)*d, d);
    } else {
      lemma_add_mul_div(a, b+1, d);
      lemma_div_ind(a + b*d, d);
    }
  }

  lemma lemma_div_multiples_vanish_fancy(x:int, b:int, d:int)
  {
    if (x == 0) {
    } else if (x > 0) {
      lemma_div_multiples_vanish_fancy(x-1, b, d);
      lemma_div_ind(d*(x-1) + b, d);
    } else {
      lemma_div_multiples_vanish_fancy(x+1, b, d);
      lemma_div_ind(d*x + b, d);
    }
  }

  lemma lemma_div_by_multiple(b:int, d:int)
  {   
      lemma_div_multiples_vanish_fancy(b, 0, d);
  }

  lemma lemma_mod_multiples_basic(x:int, m:int)
  {
    lemma_div_by_multiple(x, m);
        == 0;
  }

  lemma lemma_div_by_multiple_is_strongly_ordered(x:int, y:int, m:int, z:int)
  {
    lemma_mod_multiples_basic(m, z);
    if (x / z <= m-1) {
    } else {
      lemma_div_by_multiple_is_strongly_ordered(x, y-z, m-1, z);
    }
  }

  lemma lemma_power2_div_is_sub(x:int, y:int)
        >= 0;
  {
    calc {
        power2(y) / power2(x);
        { lemma_power2_adds(y-x, x); }
        (power2(y-x)*power2(x)) / power2(x);
        { lemma_div_by_multiple(power2(y-x), power2(x)); }
        power2(y-x);
    }
  }

  lemma lemma_div_denominator(x:int,c:nat,d:nat)
  {
    if (x < c*d) {
    } else {
      calc {
        (x / c) / d;
        ((x - c*d + c*d) / c) / d;
        {
          lemma_add_mul_div(x-c*d, d, c);
        }
        ((x - c*d) / c + d) / d;
        {
          lemma_div_ind((x - c*d) / c, d);
        }
        ((x - c*d) / c) / d + 1;
        {
          lemma_div_denominator(x - c*d, c, d);
        }
        ((x - c*d) / (c*d)) + 1;
        {
          lemma_div_ind(x - c*d, c*d);
        }
        x / (c*d);
      }
    }
  }
}

