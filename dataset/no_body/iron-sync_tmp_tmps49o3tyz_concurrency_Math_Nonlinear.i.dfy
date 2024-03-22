// Copyright 2018-2021 VMware, Inc., Microsoft Inc., Carnegie Mellon University, ETH Zurich, and University of Washington
// SPDX-License-Identifier: BSD-2-Clause

// This file is meant to be run with nonlinear-arithmetic enabled in z3.
// It only exports really basic lemmas (commutativity, associativity, etc.)
// so that these facts can be used by files that use /noNLarith

module NonlinearLemmas {
  lemma mul_assoc(a: int, b: int, c: int)
  ensures (a * b) * c == a * (b * c)
  {/* TODO */ }

  lemma mul_comm(a: int, b: int)
  ensures a * b == b * a
  {/* TODO */ }

  lemma mul_ge_0(a: int, b: int)
  requires a >= 0
  requires b >= 0
  ensures a*b >= 0
  {/* TODO */ }

  lemma mul_gt_0(a: int, b: int)
  requires a > 0
  requires b > 0
  ensures a*b > 0
  {/* TODO */ }

  lemma div_mul_plus_mod(a: int, b: int)
  requires b > 0
  ensures (a / b) * b + (a % b) == a
  {/* TODO */ }

  lemma distributive_right(a: int, b: int, c: int)
  ensures (a + b) * c == a*c + b*c
  {/* TODO */ }

  lemma distributive_left(a: int, b: int, c: int)
  ensures a * (b + c) == a*b + a*c
  {/* TODO */ }

  lemma distributive_left_sub(a: int, b: int, c: int)
  ensures a * (b - c) == a*b - a*c
  {/* TODO */ }

  lemma distributive_right_sub(a: int, b: int, c: int)
  ensures (a - b) * c == a*c - b*c
  {/* TODO */ }

  lemma div_eq_0(a: int, b: int)
  requires b > 0
  requires 0 <= a < b
  ensures a / b == 0
  {/* TODO */ }

  lemma div_ge_0(a: int, b: int)
  requires a >= 0
  requires b > 0
  ensures a / b >= 0
  {/* TODO */ }

/*
  lemma div_denom_ge_1(n: nat, b: nat)
  requires 1 <= b
  ensures n / b <= n
  {/* TODO */ }
*/

  lemma mod_ge_0(a: int, b: int)
  requires b > 0
  ensures a % b >= 0
  {/* TODO */ }

  lemma a_mod_b_eq_a(a: int, b: int)
  requires 0 <= a < b
  ensures a % b == a
  {/* TODO */ }

  lemma mul_le_left(a: int, b: int, c: int)
  requires 0 <= c
  requires a <= b
  ensures a*c <= b*c
  {/* TODO */ }

  lemma mul_le_right(a: int, b: int, c: int)
  requires 0 <= a
  requires b <= c
  ensures a*b <= a*c
  {/* TODO */ }

  lemma div_invert(a: int, b: int, c: int)
  requires 0 < b
  requires a % b == 0
  ensures a / b == c <==> a == b * c
  {/* TODO */ }

  lemma mod_bound(a: int, b: int)
  requires b > 0
  ensures 0 <= a % b <= b - 1
  {/* TODO */ }

  /*lemma mul3_bound(a: int, b: int, c: int, d: int, e: int, f: int)
  requires 0 <= a <= d
  requires 0 <= b <= e
  requires 0 <= c <= f
  ensures 0 <= a * b * c <= d * e * f*/
}

