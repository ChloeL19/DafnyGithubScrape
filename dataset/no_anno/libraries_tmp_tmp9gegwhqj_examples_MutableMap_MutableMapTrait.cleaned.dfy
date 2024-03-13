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
    method Put(k: K, v: V)
      ensures k in old(this.content()).Keys ==> this.content().Values + {old(this.content())[k]} == old(this.content()).Values + {v}
      ensures k !in old(this.content()).Keys ==> this.content().Values == old(this.content()).Values + {v}

    function Keys(): (keys: set<K>)
    predicate HasKey(k: K)
    function Values(): (values: set<V>)
    function Items(): (items: set<(K,V)>)
    function Select(k: K): (v: V)
    method Remove(k: K)
      ensures this.content() == old(this.content()) - {k}
      ensures k in old(this.content()).Keys ==> this.content().Values + {old(this.content())[k]} == old(this.content()).Values
 
    function Size(): (size: int)
