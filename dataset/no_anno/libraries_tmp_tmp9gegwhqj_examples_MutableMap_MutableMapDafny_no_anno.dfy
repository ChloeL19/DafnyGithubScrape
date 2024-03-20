/*******************************************************************************
*  Copyright by the contributors to the Dafny Project
*  SPDX-License-Identifier: MIT
*******************************************************************************/

// RUN: %verify "%s"
   
/**
  *  Implements mutable maps in Dafny to guard against inconsistent specifications.
  *  Only exists to verify feasability; not meant for actual usage.
  */
module {:options "-functionSyntax:4"} MutableMapDafny {
  /**
    *  NOTE: Only here because of #2500; once resolved import "MutableMapTrait.dfy".
    */
  trait {:termination false} MutableMapTrait<K(==),V(==)> {
    function content(): map<K, V>
      reads this

    method Put(k: K, v: V)
      modifies this
  }

  class MutableMapDafny<K(==),V(==)> extends MutableMapTrait<K,V> {
    var m: map<K,V>

    function content(): map<K, V> 
      reads this
    {
      m
    }

    constructor ()
    {
      m := map[];
    }

    method Put(k: K, v: V)
      modifies this
    {
      m := m[k := v];
      if k in old(m).Keys {
        forall v' | v' in old(m).Values + {v} ensures v' in m.Values + {old(m)[k]} {
          if v' == v || v' == old(m)[k] {
          } else {
          }
        }
      }
      if k !in old(m).Keys {
        forall v' | v' in old(m).Values + {v} ensures v' in m.Values {
          if v' == v {
          } else {
          }
        }
      }
    }

    function Keys(): (keys: set<K>)
      reads this
    {
      m.Keys
    }

    predicate HasKey(k: K)
      reads this
    {
      k in m.Keys
    }

    function Values(): (values: set<V>)
      reads this
    {
      m.Values
    }

    function Items(): (items: set<(K,V)>)
      reads this
    {
      var items := set k | k in m.Keys :: (k, m[k]);
        forall k | k in m.Keys ensures (k, m[k]) in m.Items {
        }
        forall x | x in m.Items ensures x in items {
        }
      }
      items
    }

    function Select(k: K): (v: V)
      reads this
    {
      m[k]
    }

    method Remove(k: K)
      modifies this
    {
      m := map k' | k' in m.Keys && k' != k :: m[k'];
      if k in old(m).Keys {
        var v := old(m)[k];
        forall v' | v' in old(m).Values ensures v' in m.Values + {v} {
          if v' == v {
          } else {
          }
        }
      }
    }

    function Size(): (size: int)
      reads this
    {
      |m|
    }
  }
}
