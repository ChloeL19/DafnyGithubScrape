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
  class MutableMapDafny<K(==),V(==)> extends MutableMapTrait<K,V> {
  class MutableMapDafny<K(==),V(==)> extends MutableMapTrait<K,V> {
    var m: map<K,V>

    function content(): map<K, V> 
    {
      m
    }

    constructor ()
    {
      m := map[];
    }

    method Put(k: K, v: V)
      ensures k in old(this.content()).Keys ==> this.content().Values + {old(this.content())[k]} == old(this.content()).Values + {v}
      ensures k !in old(this.content()).Keys ==> this.content().Values == old(this.content()).Values + {v}
    {
      m := m[k := v];
      if k in old(m).Keys {
        forall v' | v' in old(m).Values + {v} ensures v' in m.Values + {old(m)[k]} {
          if v' == v || v' == old(m)[k] {
            assert m[k] == v;
          } else {
            assert m.Keys == old(m).Keys + {k};
          }
        }
      }
      if k !in old(m).Keys {
        forall v' | v' in old(m).Values + {v} ensures v' in m.Values {
          if v' == v {
            assert m[k] == v;
            assert m[k] == v';
            assert v' in m.Values;
          } else {
            assert m.Keys == old(m).Keys + {k};
          }
        }
      }
    }

    function Keys(): (keys: set<K>)
    {
      m.Keys
    }

    predicate HasKey(k: K)
    {
      k in m.Keys
    }

    function Values(): (values: set<V>)
    {
      m.Values
    }

    function Items(): (items: set<(K,V)>)
    {
      var items := set k | k in m.Keys :: (k, m[k]);
      assert items == m.Items by {
        forall k | k in m.Keys ensures (k, m[k]) in m.Items {
          assert (k, m[k]) in m.Items;
        }
        assert items <= m.Items;
        forall x | x in m.Items ensures x in items {
          assert (x.0, m[x.0]) in items;
        }
        assert m.Items <= items;
      }
      items
    }

    function Select(k: K): (v: V)
    {
      m[k]
    }

    method Remove(k: K)
      ensures this.content() == old(this.content()) - {k}
      ensures k in old(this.content()).Keys ==> this.content().Values + {old(this.content())[k]} == old(this.content()).Values
    {
      m := map k' | k' in m.Keys && k' != k :: m[k'];
      if k in old(m).Keys {
        var v := old(m)[k];
        forall v' | v' in old(m).Values ensures v' in m.Values + {v} {
          if v' == v {
          } else {
            assert exists k' | k' in m.Keys :: old(m)[k'] == v';
          }
        }
      }
    }

    function Size(): (size: int)
    {
      |m|
    }
  }
}
