// RUN: %testDafnyForEachResolver "%s"


class Node<T> {
  ghost var List: seq<T>
  ghost var Repr: set<Node<T>>

  var data: T
  var next: Node?<T>

  ghost predicate Valid()
    reads this, Repr
  {
    this in Repr &&
    (next == null ==> List == [data]) &&
    (next != null ==>
        next in Repr && next.Repr <= Repr &&
        this !in next.Repr &&
        List == [data] + next.List &&
        next.Valid())
  }

  constructor (d: T)
  {
    data, next := d, null;
    List, Repr := [d], {this};
  }

  constructor InitAsPredecessor(d: T, succ: Node<T>)
  {
    data, next := d, succ;
    List := [d] + succ.List;
    Repr := {this} + succ.Repr;
  }

  method Prepend(d: T) returns (r: Node<T>)
  {
    r := new Node.InitAsPredecessor(d, this);
  }

  method SkipHead() returns (r: Node?<T>)
  {
    r := next;
  }

  method ReverseInPlace() returns (reverse: Node<T>)
  {
    var current := next;
    reverse := this;
    reverse.next := null;
    reverse.Repr := {reverse};
    reverse.List := [data];

    while current != null
    {
      var nx := current.next;

      // ..., reverse, current, nx, ...
      current.next := reverse;
      current.Repr := {current} + reverse.Repr;
      current.List := [current.data] + reverse.List;

      reverse := current;
      current := nx;
    }
  }
}

