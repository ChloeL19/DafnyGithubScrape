class Node<T> {
    ghost var s: seq<T>
    ghost var Repr: set<object>
    var data: T 
    var next: Node?<T>

    ghost predicate Valid()
        reads this, Repr
    {
        this in Repr &&
        |s| >= 1 && s[0] == data &&
        (next == null ==> |s| == 1) && 
        (next != null ==> next in Repr && next.Repr <= Repr &&
                          this !in next.Repr && next.Valid() &&
                          s == [data] + next.s)
    }

    constructor (d: T)
    {
        data := d;
        next := null;
        s, Repr := [d], {this};
    }

    method SetNext(n:Node<T>)
    {
        next := n;
        s, Repr := [s[0]] + n.s, Repr + n.Repr;
    }

    method GetNext() returns (n:Node?<T>)
    {
        n := next;
    }

    method GetValue() returns (v:T)
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
    {
        this in Repr &&
        (top == null ==> s == []) &&
        (top != null ==> top in Repr && top.Repr <= Repr &&
                         this !in top.Repr && top.Valid() && 
                         top.s == s)
    }

    constructor () 
    {
        top := null;
        s, Repr := [], {this};
    }

    method IsEmpty() returns (b:bool)
    {
        b := top == null;
    }

    method Push(v: T)
    {
        var newNode := new Node(v);
        if top != null {
            newNode.SetNext(top);
        }
        top := newNode;
        s, Repr := [v] + s, {this} + newNode.Repr;
    } 


    method Pop() returns (v:T)
    {
        v := top.GetValue();
        top := top.GetNext(); 
        s := s[1..];
    }

}
