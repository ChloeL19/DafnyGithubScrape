// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

// This file shows an example program that uses both refinement and :autocontracts
// specify a class that stores a set of things that can be retrieved using a query.
//
// (For another example that uses these features, see Test/dafny3/CachedContainer.dfy.)

abstract module AbstractInterface {
  class {:autocontracts} StoreAndRetrieve<Thing(==)> {
    ghost var Contents: set<Thing>
    ghost predicate Valid() {
      Valid'()
    }
    ghost predicate {:autocontracts false} Valid'()
      reads this, Repr
    constructor Init()
      ensures Contents == {}
    method Store(t: Thing)
      ensures Contents == old(Contents) + {/* TODO */ }
    method Retrieve(matchCriterion: Thing -> bool) returns (thing: Thing/* TODO */ }
}

abstract module A refines AbstractInterface {/* TODO */ }

abstract module B refines A {
  class StoreAndRetrieve<Thing(==)> ... {
    var arr: seq<Thing>
    ghost predicate Valid'...
    {
      Contents == set x | x in arr
    }
    constructor Init...
    {
      arr := [];
      new;
      assert ...;
    }
    method Store...
    {/* TODO */ }
    method Retrieve...
    {/* TODO */ }
  }
}

module abC refines B { // TODO module C causes Go to fail
  class StoreAndRetrieve<Thing(==)> ... {
    method Retrieve...
    {/* TODO */ }
  }
}

abstract module AbstractClient {
  import S : AbstractInterface

  method Test() {/* TODO */ }
}

module Client refines AbstractClient {
  import S = abC
  method Main() {/* TODO */ }
}

