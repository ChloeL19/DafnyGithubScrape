// RUN: %testDafnyForEachCompiler --refresh-exit-code=0 "%s" -- --relax-definite-assignment

class List<T> {
  ghost var Contents: seq<T>
  ghost var Repr: set<object>

  var a: array<T>
  var n: nat

  ghost predicate Valid()
    reads this, Repr
  {
    this in Repr &&
    a in Repr &&
    n <= a.Length &&
    Contents == a[..n]
  }

  constructor Init()
  {
    Contents, n := [], 0;
    a := new T[0];
    Repr := {this, a};
  }

  method Add(t: T)
  {
    if (n == a.Length) {
      var b := new T[2 * a.Length + 1](i requires 0 <= i reads this, a =>
                                       if i < a.Length then a[i] else t);
      a, Repr := b, Repr + {b};
    }
    a[n], n, Contents := t, n + 1, Contents + [t];
  }
}

class Cell { var data: int }

iterator M<T(0)>(l: List<T>, c: Cell) yields (x: T)
{
  var i := 0;
  while i < l.n
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
{
  var c := new Cell;
  var iter := new M(l, c);
  s := [];
  while true
  {
    var more := iter.MoveNext();
    if (!more) { break; }
    s := s + [iter.x];
    if (iter.x == stop) { return; }  // if we ever see 'stop', then just end
  }
}

method PrintSequence<T>(s: seq<T>)
{
  var i := 0;
  while i < |s|
  {
    print s[i], " ";
    i := i + 1;
  }
  print "\n";
}

method Main()
{
  var myList := new List.Init();
  var i := 0;
  while i < 100
  {
    myList.Add(i);
    i := i + 2;
  }
  var s := Client(myList, 89);
  PrintSequence(s);
  s := Client(myList, 14);
  PrintSequence(s);
}

