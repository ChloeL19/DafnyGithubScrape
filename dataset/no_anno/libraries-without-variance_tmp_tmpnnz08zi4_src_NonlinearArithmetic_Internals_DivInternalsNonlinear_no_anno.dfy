// RUN: %dafny /compile:0 "%s"

/*******************************************************************************
*  Original: Copyright (c) Microsoft Corporation
*  SPDX-License-Identifier: MIT
*  
*  Modifications and Extensions: Copyright by the contributors to the Dafny Project
*  SPDX-License-Identifier: MIT 
*******************************************************************************/

module DivInternalsNonlinear {

  /* WARNING: Think three times before adding to this file, as nonlinear
  verification is highly unstable! */

  /* zero divided by an integer besides 0 is 0 */
  lemma LemmaDivOf0(d:int)
  { 
  }

  /* the quotient of an integer divided by itself is 1 */
  lemma LemmaDivBySelf(d:int)
  { 
  }

  /* dividing a smaller integer by a larger integer results in a quotient of 0  */
  lemma LemmaSmallDiv()
  { 
  }

  /* the quotient of dividing a positive real number (not 0) by a smaller positive real number
  will be greater than 1 */ 
  lemma LemmaRealDivGt(x:real, y:real)
  { 
  }
  
}

