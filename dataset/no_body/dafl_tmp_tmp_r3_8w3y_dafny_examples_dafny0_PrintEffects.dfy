// RUN:   %baredafny run --use-basename-for-filename --cores:2 --verification-time-limit:300 "%s" > "%t"
// RUN: ! %baredafny run --use-basename-for-filename --cores:2 --verification-time-limit:300 --track-print-effects "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

method {/* TODO */ } P() {
  print "method P here\n";
  M();
  var iter0 := new NoPrintIter(3);
  var iter1 := new PrintIter(3);
  print "calling MoveNexts\n";
  MoveNexts(iter0, iter1);
  var cl := new Cl.NoPrint();
  cl := new Cl.Print();

  TestOverrides();
}

method MoveNexts(iter0: NoPrintIter, iter1: PrintIter)
  requires iter0.Valid() && iter1.Valid()
  requires iter0._modifies == iter0._new == iter0._reads == {/* TODO */ }
  requires iter1._modifies == iter1._new == iter1._reads == {}
  modifies iter0, iter1
{
  var more0 := iter0.MoveNext();
  var more1 := iter1.MoveNext(); // error: cannot print from this method
}

method M() {/* TODO */ }

function F(x: int): int {/* TODO */ } by method {
  print "function-by-method F\n"; // error: cannot print from this method
  return 10;
}

iterator NoPrintIter(a: int) yields (x: int)
{/* TODO */ }

iterator {/* TODO */ } PrintIter(a: int) yields (x: int)
{
  print "Start of Iter 1\n";
  yield 3 + a;
  print "End of Iter 1\n";
}

class Cl {
  constructor NoPrint() {
    print "Cl.NoPrint ctor\n"; // error: cannot print from this method
  }
  constructor {/* TODO */ } Print() {
    print "Cl.Print ctor\n";
  }
}

trait Trait {
  method {:print} MayPrint()
  method {/* TODO */ } AlwaysPrints()
}

class Overrides extends Trait {
  method MayPrint() {/* TODO */ }
  method {:print} AlwaysPrints() {/* TODO */ }
}

method {:print} TestOverrides() {/* TODO */ }

method TestOverridesNoPrint(c: Overrides, t: Trait) {/* TODO */ }

