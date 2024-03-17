/*******************************************************************************
*  Copyright by the contributors to the Dafny Project
*  SPDX-License-Identifier: MIT
*******************************************************************************/

// RUN: %verify "%s"

/**
  *  Specifications that should be satisfied by any implementation of mutable maps.
  *  Possible instantiations are given in "MutableMapDafny.dfy" (not meant for usage, 
  *  only exists to verify feasability) and "../../src/MutableMap/MutableMap.dfy" 
  *  (meant for usage; interfaces with external code, e.g. "../../src/MutableMap/
  *  MutableMap.java").
  */
module {:options "-functionSyntax:4"} MutableMapTrait {
  trait {:termination false} MutableMapTrait<K(==),V(==)> {
    function content(): map<K, V>
  }
}
