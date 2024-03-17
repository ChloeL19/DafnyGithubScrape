// Examples used in paper:
//   Specification and Verification of Object-Oriented Software
// by K. Rustan M. Leino
// link of the paper:
//   http://leino.science/papers/krml190.pdf

// Figure 0. An example linked-list program written in Dafny.
class Data { }

class Node {
  var list: seq<Data>;
  var footprint: set<Node>;

  var data: Data;
  var next: Node?;

  function Valid(): bool
  {
    this in footprint &&
    (next == null ==> list  == [data]) &&
    (next != null ==> next in footprint &&
                      next.footprint <= footprint &&
                      !(this in next.footprint) &&
                      list == [data] + next.list &&
                      next.Valid())
  }

  constructor(d: Data)
  {
    data := d;
    next := null;
    list := [d];
    footprint := {this};
  }

  method SkipHead() returns (r: Node?)
  {
    return next;
  }

  method Prepend(d: Data) returns (r: Node)
  {
    r := new Node(d);
    r.data := d;
    r.next := this;
    r.footprint := {r} + footprint;
    r.list := [r.data] + list;
  }

  // Figure 1: The Node.ReverseInPlace method,
  //     which performs an in situ list reversal.
  method ReverseInPlace() returns (reverse: Node)
  {
    var current: Node?;
    current := next;
    reverse := this;
    reverse.next := null;
    reverse.footprint := {reverse};
    reverse.list := [data];

    while current != null
    {
      var nx: Node?;
      nx := current.next;
              current.list[i + 1] == nx.list[i];
      // The state looks like: ..., reverse, current, nx, ...
      current.next := reverse;
      current.footprint := {current} + reverse.footprint;
      current.list := [current.data] + reverse.list;

      reverse := current;
      current := nx;
    }
  }
}
