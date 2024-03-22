// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

// This file contains an example chain of module refinements, starting from a
// simple interface M0 to an implementation M3. Module Client.Test() is
// verified against the original M0 module. Module CachedClient instantiates
// the abstract import of M0 with the concrete module M3, and then gets to
// reuse the proof done in Client.
//
// At a sufficiently abstract level, the concepts used are all standard.
// However, it can be tricky to set these things up in Dafny, if you want
// the final program to be a composition of smaller refinement steps.
//
// Textually, refinement modules in Dafny are written with "...", rather
// than by repeating the program text from the module being refined.
// This can be difficult to both author and read, so this file can be
// used as a guide for what to aim for. Undoubtedly, use of the /rprint:-
// option on the command line will be useful, since it lets you see what
// all the ...'s expand to.
//
// As a convenience, this program also uses a second experimental feature,
// namely the preprocessing requested by :autocontracts, which supplies
// much of the boilerplate specifications that one uses with the
// dynamic-frames idiom in Dafny. This feature was designed to reduce clutter
// in the program text, but can increase the mystery behind what's really
// going on. Here, too, using the /rprint:- option will be useful, since
// it shows the automatically generated specifications and code.
//
// (For another example that uses these features, see Test/dafny2/StoreAndRetrieve.dfy.)


// give the method signatures and specs
abstract module M0 {/* TODO *//* TODO */ }

// provide bodies for the methods
abstract module M1 refines M0 {/* TODO */ }

// implement the set in terms of a sequence
abstract module M2 refines M1 {
  class Container<T(==)> ... {
    var elems: seq<T>
    ghost predicate Valid'...
    {
      Contents == (set x | x in elems) &&
      (forall i,j :: 0 <= i < j < |elems| ==> elems[i] != elems[j]) &&
      Valid''()
    }
    ghost predicate {:autocontracts false} Valid''()
      reads this, Repr
    method FindIndex(t: T) returns (j: nat)
      ensures j <= |elems|
      ensures if j < |elems| then elems[j] == t else t !in elems
    {/* TODO */ }

    constructor... {
      elems := [];
      new;
      label CheckPost:
      assume Valid''();  // to be checked in further refinements
      assert ...;
    }
    method Add... {/* TODO */ }
    method Remove... {/* TODO */ }
    method Contains... {/* TODO */ }
  }
}

// implement a cache

module M3 refines M2 {
  datatype Cache<T> = None | Some(index: nat, value: T)
  class Container<T(==)> ... {
    var cache: Cache<T>
    ghost predicate Valid''... {
      cache.Some? ==> cache.index < |elems| && elems[cache.index] == cache.value
    }
    constructor... {
      cache := None;
      new;
      ...;
      assert ...;
    }
    method FindIndex... {/* TODO */ }
    method Add... {/* TODO */ }
    method Remove... {/* TODO */ }
  }
}

// here a client of the Container
abstract module Client {
  import M : M0
  method Test() {/* TODO */ }
}

module CachedClient refines Client {
  import M = M3
  method Main() {/* TODO */ }
}

