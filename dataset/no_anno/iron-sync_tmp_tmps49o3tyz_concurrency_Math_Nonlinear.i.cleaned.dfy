// Copyright 2018-2021 VMware, Inc., Microsoft Inc., Carnegie Mellon University, ETH Zurich, and University of Washington
// SPDX-License-Identifier: BSD-2-Clause

// This file is meant to be run with nonlinear-arithmetic enabled in z3.
// It only exports really basic lemmas (commutativity, associativity, etc.)
// so that these facts can be used by files that use /noNLarith

module NonlinearLemmas {
  lemma mul_assoc(a: int, b: int, c: int)
  {
  }

  lemma mul_comm(a: int, b: int)
  {
  }

  lemma mul_ge_0(a: int, b: int)
  {
  }

  lemma mul_gt_0(a: int, b: int)
  {
  }

  lemma div_mul_plus_mod(a: int, b: int)
  {
  }

  lemma distributive_right(a: int, b: int, c: int)
  {
  }

  lemma distributive_left(a: int, b: int, c: int)
  {
  }

  lemma distributive_left_sub(a: int, b: int, c: int)
  {
  }

  lemma distributive_right_sub(a: int, b: int, c: int)
  {
  }

  lemma div_eq_0(a: int, b: int)
  {
  }

  lemma div_ge_0(a: int, b: int)
  {
  }

/*
  lemma div_denom_ge_1(n: nat, b: nat)
  {
  }
*/

  lemma mod_ge_0(a: int, b: int)
  {
  }

  lemma a_mod_b_eq_a(a: int, b: int)
  {
  }

  lemma mul_le_left(a: int, b: int, c: int)
  {
  }

  lemma mul_le_right(a: int, b: int, c: int)
  {
  }

  lemma div_invert(a: int, b: int, c: int)
  {
  }

  lemma mod_bound(a: int, b: int)
  {
  }

  /*lemma mul3_bound(a: int, b: int, c: int, d: int, e: int, f: int)
  requires 0 <= a <= d
  requires 0 <= b <= e
  requires 0 <= c <= f
  ensures 0 <= a * b * c <= d * e * f*/
}

