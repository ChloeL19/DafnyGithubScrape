module Rope {
class Rope {
ghost var Contents: string;
ghost var Repr: set<Rope>;

var data: string;
var weight: nat;
var left: Rope?;
var right: Rope?;

ghost predicate Valid() 
    reads this, Repr
{
    this in Repr &&
    (left != null ==> 
        left in Repr &&
        left.Repr < Repr && this !in left.Repr &&
        left.Valid() &&
        (forall child :: child in left.Repr ==> child.weight <= weight)) &&
    (right != null ==> 
        right in Repr &&
        right.Repr < Repr && this !in right.Repr &&
        right.Valid()) &&
    (left == null && right == null ==>
        Repr == {this} &&
        Contents == data &&
        weight == |data| &&
        data != "") &&
    (left != null && right == null ==>
        Repr == {this} + left.Repr &&
        Contents == left.Contents &&
        weight == |left.Contents| &&
        data == "") &&
    (left == null && right != null ==>
        Repr == {this} + right.Repr &&
        Contents == right.Contents &&
        weight == 0 &&
        data == "") &&
    (left != null && right != null ==>
        Repr == {this} + left.Repr + right.Repr &&
        left.Repr !! right.Repr &&
        Contents == left.Contents + right.Contents &&
        weight == |left.Contents| &&
        data == "") 
}

lemma contentSizeGtZero()
{}

function getWeightsOfAllRightChildren(): nat
    reads right, Repr
{
    if right == null then 0
    else right.weight + right.getWeightsOfAllRightChildren()
} 

function length(): nat
    reads Repr
{
    this.weight + getWeightsOfAllRightChildren()
}

// constructor for creating a terminal node
constructor Terminal(x: string)
{ 
    data := x;
    weight := |x|;
    left := null;
    right := null;
    Contents := x;
    Repr := {this};
}   

predicate isTerminal()
    reads this, this.left, this.right
{ left == null && right == null }

method report(i: nat, j: nat) returns (s: string)
{
    if i == j {
        s := "";
    } else {
        if this.left == null && this.right == null {
            s := data[i..j];
        } else {
            if (j <= this.weight) {
                var s' := this.left.report(i, j);
                s := s';
            } else if (this.weight <= i) {
                var s' := this.right.report(i - this.weight, j - this.weight);
                s := s';
            } else {
                // removing this assertion causes error
                var s1 := this.left.report(i, this.weight);
                var s2 := this.right.report(0, j - this.weight);
                s := s1 + s2;
            }
        }
    }
}

method toString() returns (s: string)
{
    s := report(0, this.length());
}

method getCharAtIndex(index: nat) returns (c: char)
{
    var nTemp := this;
    var i := index;
    while (!nTemp.isTerminal()) 
    {
        if (i < nTemp.weight) {
            nTemp := nTemp.left;
        } else {
            i := i - nTemp.weight;
            nTemp := nTemp.right;
        }
    }
    // Have reached the terminal node with index i
    c := nTemp.data[i];
}

static method concat(n1: Rope?, n2: Rope?) returns (n: Rope?) 
{
    if (n1 == null) {
        n := n2;
    } else if (n2 == null) {
        n := n1;
    } else {
        n := new Rope.Terminal("placeholder");
        n.left := n1;
        n.right := n2;
        n.data := "";

        var nTemp := n1;
        var w := 0;
        ghost var nodesTraversed : set<Rope> := {};

        while (nTemp.right != null)
        {
            w := w + nTemp.weight;
            if (nTemp.left != null) {
                nodesTraversed := nodesTraversed + nTemp.left.Repr + {nTemp};
            } else {
                nodesTraversed := nodesTraversed + {nTemp};
            }
            nTemp := nTemp.right;
        }
        w := w + nTemp.weight;
        if (nTemp.left != null) {
            nodesTraversed := nodesTraversed + nTemp.left.Repr + {nTemp};
        } else {
            nodesTraversed := nodesTraversed + {nTemp};
        }
        n.weight := w;
        n.Contents := n1.Contents + n2.Contents;
        n.Repr := {n} + n1.Repr + n2.Repr;
        } 
} 


/**
    Dafny needs help to guess that in our definition, every rope must
    have non-empty Contents, otherwise it is represented by [null].

    The lemma contentSizeGtZero(n) is thus important to prove the
    postcondition of this method, in the two places where the lemma is
    invoked.
*/
static method split(n: Rope, index: nat) returns (n1: Rope?, n2: Rope?) 
{
    if (index == 0) {
        n1 := null;
        n2 := n;
        n.contentSizeGtZero();
        // assert index != |n.Contents|;
    } else if (index < n.weight) {
        if (n.left != null) {
            var s1, s2 := split(n.left, index);
            n1 := s1;
            n2 := concat(s2, n.right);
        } else {
            // terminal node
            if (index == 0) {
                n1 := null;
                n2 := n;
            } else {
                n1 := new Rope.Terminal(n.data[..index]);
                n2 := new Rope.Terminal(n.data[index..]);
            }
        }
    } else if (index > n.weight) {
        var s1, s2 := split(n.right, index - n.weight);
        n1 := concat(n.left, s1);
        n2 := s2;
    } else {
        // since [n.weight == index != 0], it means that [n] cannot be a
        // non-terminal node with [left == null].
        if (n.left != null && n.right == null) {
            n1 := n.left;
            n2 := null;
        } else if (n.left != null && n.right != null) {
            n.right.contentSizeGtZero();
            // assert index != |n.Contents|;
            n1 := n.left;
            n2 := n.right;
        } else {
            n1 := n;
            n2 := null;
        }
    }
}

static method insert(n1: Rope, n2: Rope, index: nat) returns (n: Rope)
{
    var n1BeforeIndex, n1AfterIndex := split(n1, index);
    var firstPart := concat(n1BeforeIndex, n2);
    n := concat(firstPart, n1AfterIndex);
}

static method delete(n: Rope, i: nat, j: nat) returns (m: Rope?)
{
    var l1, l2 := split(n, i);
    var r1, r2 := split(l2, j - i);
    m := concat(l1, r2);
}

static method substring(n: Rope, i: nat, j: nat) returns (m: Rope?)
{
    var l1, l2 := split(n, i);
    var r1, r2 := split(l2, j - i);
    m := r1;
}

}
// End of Rope Class
}
// End of Rope Module
