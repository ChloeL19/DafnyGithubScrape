// RUN: %testDafnyForEachCompiler "%s" -- --relax-definite-assignment

abstract module M0 {
  class Counter {
    ghost var N: int
    ghost var Repr: set<object>
    ghost predicate Valid()
      reads this, Repr
      ensures Valid() ==> this in Repr

    constructor Init()
      ensures N == 0
      ensures Valid() && fresh(Repr)
    {
      Repr := {};
      new;
      ghost var repr :| {this} <= repr && fresh(repr - {this});
      N, Repr := 0, repr;
      assume Valid();  // to be verified in refinement module
    }

    method Inc()
      requires Valid()
      modifies Repr
      ensures N == old(N) + 1
      ensures Valid() && fresh(Repr - old(Repr))
    {/* TODO */ }

    method Get() returns (n: int)
      requires Valid()
      ensures n == N
    {/* TODO */ }
  }
}

module M1 refines M0 {
  class Cell {
    var data: int
    constructor (d: int)
      ensures data == d
    { data := d; }
  }

  class Counter ... {
    var c: Cell
    var d: Cell
    ghost predicate Valid...
    {
      this in Repr &&
      c in Repr &&
      d in Repr &&
      c != d &&
      N == c.data - d.data
    }

    constructor Init...
    {
      c := new Cell(0);
      d := new Cell(0);
      new;
      ghost var repr := Repr + {this} + {c,d};
      ...;
      assert ...;
    }

    method Inc...
    {/* TODO */ }

    method Get...
    {/* TODO */ }
  }
}

method Main() {/* TODO */ }

