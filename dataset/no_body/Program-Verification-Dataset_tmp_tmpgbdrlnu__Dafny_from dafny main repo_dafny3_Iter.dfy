// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

class List<T> {
  ghost var Contents: seq<T>
  ghost var Repr: set<object>

  var a: array<T>
  var n: nat

  ghost predicate Valid()
    reads this, Repr
    ensures Valid() ==> this in Repr
  {
    this in Repr &&
    a in Repr &&
    n <= a.Length &&
    Contents == a[..n]
  }

  constructor Init()
    ensures Valid() && fresh(Repr)
    ensures Contents == []
  {
    Contents, n := [], 0;
    a := new T[0];
    Repr := {this, a};
  }

  method Add(t: T)
    requires Valid()
    modifies Repr
    ensures Valid() && fresh(Repr - old(Repr))
    ensures Contents == old(Contents) + [t]
  {/* TODO */ }
}

class Cell { var data: int }

iterator M<T(0)>(l: List<T>, c: Cell) yields (x: T)
  requires l.Valid()
  reads l.Repr
  modifies c
  yield requires true
  yield ensures xs <= l.Contents  // this is needed in order for the next line to be well-formed
  yield ensures x == l.Contents[|xs|-1]
  ensures xs == l.Contents
{
  var i := 0;
  while i < l.n
    invariant i <= l.n && i == |xs| && xs <= l.Contents
  {
    if (*) { assert l.Valid(); }  // this property is maintained, due to the reads clause
    if (*) {
      x := l.a[i]; yield;  // or, equivalently, 'yield l.a[i]'
      i := i + 1;
    } else {
      x, i := l.a[i], i + 1;
      yield;
    }
  }
}

method Client<T(==,0)>(l: List, stop: T) returns (s: seq<T>)
  requires l.Valid()
{/* TODO */ }

method PrintSequence<T>(s: seq<T>)
{/* TODO */ }

method Main()
{/* TODO */ }

