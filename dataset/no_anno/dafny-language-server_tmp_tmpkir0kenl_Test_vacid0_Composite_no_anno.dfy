// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Composite {
  var left: Composite?
  var right: Composite?
  var parent: Composite?
  var val: int
  var sum: int

  function Valid(S: set<Composite>): bool
    reads this, parent, left, right
  {
    this in S &&
    (parent != null ==> parent in S && (parent.left == this || parent.right == this)) &&
    (left != null ==> left in S && left.parent == this && left != right) &&
    (right != null ==> right in S && right.parent == this && left != right) &&
    sum == val + (if left == null then 0 else left.sum) + (if right == null then 0 else right.sum)
  }

  function Acyclic(S: set<Composite>): bool
    reads S
  {
    this in S &&
    (parent != null ==> parent.Acyclic(S - {this}))
  }

  method Init(x: int)
    modifies this
  {
    parent := null;
    left := null;
    right := null;
    val := x;
    sum := val;
  }

  method Update(x: int, ghost S: set<Composite>)
  {
    var delta := x - val;
    val := x;
    Adjust(delta, S, S);
  }

  method Add(ghost S: set<Composite>, child: Composite, ghost U: set<Composite>)
  {
    if (left == null) {
      left := child;
    } else {
      right := child;
    }
    child.parent := this;
    Adjust(child.sum, S, S+U);
  }

  method Dislodge(ghost S: set<Composite>)
  {
    var p := parent;
    parent := null;
    if (p != null) {
      if (p.left == this) {
        p.left := null;
      } else {
        p.right := null;
      }
      var delta := -sum;
      p.Adjust(delta, S - {this}, S);
    }
  }

  /*private*/ method Adjust(delta: int, ghost U: set<Composite>, ghost S: set<Composite>)
  {
    var p: Composite? := this;
    ghost var T := U;
    while (p != null)
    {
      p.sum := p.sum + delta;
      T := T - {p};
      p := p.parent;
    }
  }
}

method Main()
{
  var c0 := new Composite.Init(57);

  var c1 := new Composite.Init(12);
  c0.Add({c0}, c1, {c1});

  var c2 := new Composite.Init(48);

  var c3 := new Composite.Init(48);
  c2.Add({c2}, c3, {c3});
  c0.Add({c0,c1}, c2, {c2,c3});

  ghost var S := {c0, c1, c2, c3};
  c1.Update(100, S);
  c2.Update(102, S);

  c2.Dislodge(S);
  c2.Update(496, S);
  c0.Update(0, S);
}

method Harness() {
  var a := new Composite.Init(5);
  var b := new Composite.Init(7);
  a.Add({a}, b, {b});
  b.Update(17, {a,b});
  var c := new Composite.Init(10);
  b.Add({a,b}, c, {c});
  b.Dislodge({a,b,c});
}


