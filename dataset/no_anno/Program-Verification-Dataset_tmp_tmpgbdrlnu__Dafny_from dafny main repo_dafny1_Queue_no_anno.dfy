// RUN: %testDafnyForEachResolver "%s"


// Queue.dfy
// Dafny version of Queue.bpl
// Rustan Leino, 2008

class Queue<T(0)> {
  var head: Node<T>
  var tail: Node<T>

  ghost var contents: seq<T>
  ghost var footprint: set<object>
  ghost var spine: set<Node<T>>

  ghost predicate Valid()
  {
    this in footprint && spine <= footprint &&
    head in spine &&
    tail in spine &&
    tail.next == null &&
    (forall n ::
      n in spine ==>
        n.footprint <= footprint && this !in n.footprint &&
        n.Valid() &&
        (n.next == null ==> n == tail)) &&
    (forall n ::
      n in spine ==>
        n.next != null ==> n.next in spine) &&
    contents == head.tailContents
  }

  constructor Init()
  {
    var n: Node<T> := new Node<T>.Init();
    head := n;
    tail := n;
    contents := n.tailContents;
    footprint := {this} + n.footprint;
    spine := {n};
  }

  method Rotate()
  {
    var t := Front();
    Dequeue();
    Enqueue(t);
  }

  method RotateAny()
  {
    var t := Front();
    Dequeue();
    Enqueue(t);
  }

  method IsEmpty() returns (isEmpty: bool)
  {
    isEmpty := head == tail;
  }

  method Enqueue(t: T)
  {
    var n := new Node<T>.Init();
    n.data := t;
    tail.next := n;
    tail := n;

    forall m | m in spine {
      m.tailContents := m.tailContents + [t];
    }
    contents := head.tailContents;

    forall m | m in spine {
      m.footprint := m.footprint + n.footprint;
    }
    footprint := footprint + n.footprint;

    spine := spine + {n};
  }

  method Front() returns (t: T)
  {
    t := head.next.data;
  }

  method Dequeue()
  {
    var n := head.next;
    head := n;
    contents := n.tailContents;
  }
}

class Node<T(0)> {
  var data: T
  var next: Node?<T>

  ghost var tailContents: seq<T>
  ghost var footprint: set<object>

  ghost predicate Valid()
  {
    this in footprint &&
    (next != null ==> next in footprint && next.footprint <= footprint) &&
    (next == null ==> tailContents == []) &&
    (next != null ==> tailContents == [next.data] + next.tailContents)
  }

  constructor Init()
  {
    next := null;
    tailContents := [];
    footprint := {this};
  }
}

class Main<U(0)> {
  method A<T(0)>(t: T, u: T, v: T)
  {
    var q0 := new Queue<T>.Init();
    var q1 := new Queue<T>.Init();

    q0.Enqueue(t);
    q0.Enqueue(u);

    q1.Enqueue(v);

    var w := q0.Front();
    q0.Dequeue();

    w := q0.Front();
  }

  method Main2(t: U, u: U, v: U, q0: Queue<U>, q1: Queue<U>)
  {
    q0.Enqueue(t);
    q0.Enqueue(u);

    q1.Enqueue(v);

    var w := q0.Front();
    q0.Dequeue();

    w := q0.Front();
  }
}

