// RUN: %testDafnyForEachCompiler "%s" -- --relax-definite-assignment

abstract module M0 {
  class Counter {
    ghost var N: int
    ghost var Repr: set<object>
    ghost predicate Valid()
      reads this, Repr
    {
      Repr := {};
      new;
      ghost var repr :| {this} <= repr && fresh(repr - {this});
      N, Repr := 0, repr;
      assume Valid();  // to be verified in refinement module
    }

    method Inc()
    {
      N := N + 1;
      modify Repr - {this};
      assume Valid();  // to be verified in refinement module
    }

    method Get() returns (n: int)
    {
      n :| assume n == N;
    }
  }
}

module M1 refines M0 {
  class Cell {
    var data: int
    constructor (d: int)
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
    }

    method Inc...
    {
      ...;
      modify ... {
        c.data := c.data + 1;
      }
    }

    method Get...
    {
      n := c.data - d.data;
    }
  }
}

method Main() {
  var mx := new M1.Counter.Init();
  var my := new M1.Counter.Init();
  mx.Inc();
  my.Inc();
  mx.Inc();
  var nx := mx.Get();
  var ny := my.Get();
  print nx, " ", ny, "\n";
}

