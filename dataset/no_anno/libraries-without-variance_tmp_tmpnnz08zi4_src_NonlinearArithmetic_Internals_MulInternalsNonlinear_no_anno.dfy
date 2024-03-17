// RUN: %dafny /compile:0 "%s"

/*******************************************************************************
*  Original: Copyright (c) Microsoft Corporation
*  SPDX-License-Identifier: MIT
*  
*  Modifications and Extensions: Copyright by the contributors to the Dafny Project
*  SPDX-License-Identifier: MIT 
*******************************************************************************/

module MulInternalsNonlinear {

  /* WARNING: Think three times before adding to this file, as nonlinear
  verification is highly unstable! */

  /* multiplying two positive integers will result in a positive integer */
  lemma LemmaMulStrictlyPositive(x: int, y: int)
  {}

  /* multiplying two nonzero integers will never result in 0 as the poduct */
  lemma LemmaMulNonzero(x: int, y: int)
  {}

  /* multiplication is associative */
  lemma LemmaMulIsAssociative(x: int, y: int, z: int)
  {}

  /* multiplication is distributive */
  lemma LemmaMulIsDistributiveAdd(x: int, y: int, z: int)
  {}

  /* the product of two integers is greater than the value of each individual integer */ 
  lemma LemmaMulOrdering(x: int, y: int)
  {}

  /* multiplying by a positive integer preserves inequality */
  lemma LemmaMulStrictInequality(x: int, y: int, z: int)
  {}

}

