class Node<T> {
    ghost var s: seq<T>
    ghost var Repr: set<object>
    var data: T 
    var next: Node?<T>

    ghost predicate Valid()
        reads this, Repr
        ensures Valid() ==> this in Repr
    {
        this in Repr &&
        |s| >= 1 && s[0] == data &&
        (next == null ==> |s| == 1) && 
        (next != null ==> next in Repr && next.Repr <= Repr &&
                          this !in next.Repr && next.Valid() &&
                          s == [data] + next.s)
    }

    constructor (d: T)
        ensures Valid() && fresh(Repr)
        ensures s == [d]
    {
        data := d;
        next := null;
        s, Repr := [d], {this};
    }

    method SetNext(n:Node<T>)
        requires Valid() && n.Valid() && this !in n.Repr
        modifies Repr
        ensures Valid() && fresh(Repr-old(Repr)-n.Repr)
        ensures s == old([s[0]]) + n.s
    {
        next := n;
        s, Repr := [s[0]] + n.s, Repr + n.Repr;
    }

    method GetNext() returns (n:Node?<T>)
        requires Valid()
        ensures |s| == 1  ==> n == null
        ensures |s| > 1 ==> n != null && n.s == s[1..] &&
                            n.Repr <= Repr && this !in n.Repr && n.Valid()           
    {
        n := next;
    }

    method GetValue() returns (v:T)
        requires Valid()
        ensures v == s[0]
    {
        v := data;
    }
    
}

method Main<T>(t:T) {
    var n1 := new Node(t);
    var n2 := new Node(t);
    n1.SetNext(n2);
    var n3 := n1.GetNext();
    var n4 := new Node(t);
    n3.SetNext(n4);
}

class Stack<T> {
	ghost var s: seq<T>
    ghost var Repr: set<object>
    var top: Node?<T>

    ghost predicate Valid()
        reads this, Repr
        ensures Valid() ==> this in Repr
    {
        this in Repr &&
        (top == null ==> s == []) &&
        (top != null ==> top in Repr && top.Repr <= Repr &&
                         this !in top.Repr && top.Valid() && 
                         top.s == s)
    }

    constructor () 
        ensures Valid() && fresh(Repr)
        ensures s == []
    {
        top := null;
        s, Repr := [], {this};
    }

    method IsEmpty() returns (b:bool)
        requires Valid()
        ensures b <==> s == []
    {
        b := top == null;
    }

    method Push(v: T)
        requires Valid()
        modifies Repr
        ensures Valid() && fresh(Repr - old(Repr))
        ensures s == [v] + old(s)
    {
        var newNode := new Node(v);
        if top != null {
            newNode.SetNext(top);
        }
        top := newNode;
        s, Repr := [v] + s, {this} + newNode.Repr;
    } 


    method Pop() returns (v:T)
        requires Valid() && s != []
        modifies Repr
        ensures Valid() && fresh(Repr - old(Repr))
        ensures v == old(s[0]) && s == old(s[1..])
    {
        v := top.GetValue();
        top := top.GetNext(); 
        s := s[1..];
    }

}
