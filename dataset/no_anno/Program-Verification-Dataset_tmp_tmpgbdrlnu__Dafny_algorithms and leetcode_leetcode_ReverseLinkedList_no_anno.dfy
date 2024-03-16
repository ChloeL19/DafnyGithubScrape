/*
https://leetcode.com/problems/reverse-linked-list/description/
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }

function reverseList(head: ListNode | null): ListNode | null {
    if (head == null) return null;

    let curr = head;
    let prev = null;
    while(curr !== null && curr.next !== null) {
        let next = curr.next;
        curr.next = prev;
        prev = curr;
        curr = next;
    }

    curr.next = prev;

    return curr;

};
*/

datatype ListNode = Null | Node(val: nat, next: ListNode)

function reverse<A>(x: seq<A>): seq<A> 

{
    if x == [] then [] else reverse(x[1..])+[x[0]]
}

function nodeConcat(xs: ListNode, end: ListNode): ListNode {
    if xs == Null then end else Node(xs.val, nodeConcat(xs.next, end))
}

function reverseList(xs: ListNode): ListNode

{
    if xs == Null then Null else nodeConcat(reverseList(xs.next), Node(xs.val, Null))
}

lemma ConcatNullIsRightIdentity(xs: ListNode) 
{

}

lemma ConcatNullIsLeftIdentity(xs: ListNode) 
{

}

lemma ConcatExtensionality(xs: ListNode)
{

}

lemma ConcatAssociative(xs: ListNode, ys: ListNode, zs: ListNode)
{

}

lemma reverseSingleList(xs: ListNode) 
{

}



lemma {:verify true} ConcatReverseList(xs:ListNode, ys: ListNode) 
{
    if xs == Null {
        calc {
            reverseList(nodeConcat(xs,ys));
            == {ConcatNullIsLeftIdentity(ys);}
            reverseList(ys);
            == {ConcatNullIsRightIdentity(reverseList(ys));}
            nodeConcat(reverseList(ys), Null);
            nodeConcat(reverseList(ys), xs);
            nodeConcat(reverseList(ys), reverseList(xs));
        }
    }else{
        var x := Node(xs.val, Null);
        calc {
            reverseList(nodeConcat(xs, ys));
            reverseList(nodeConcat(nodeConcat(x, xs.next), ys));
            == {ConcatAssociative(x, xs.next, ys);}
            reverseList(nodeConcat(x, nodeConcat(xs.next, ys)));
            nodeConcat(reverseList(nodeConcat(xs.next, ys)), x);
            == {ConcatReverseList(xs.next, ys);}
            nodeConcat(nodeConcat(reverseList(ys) , reverseList(xs.next)), x);
            == {ConcatAssociative(reverseList(ys), reverseList(xs.next), x);}
            nodeConcat(reverseList(ys) , nodeConcat(reverseList(xs.next), x));
            nodeConcat(reverseList(ys) , reverseList(xs));
        }

    }
}

lemma reverseReverseListIsIdempotent(xs: ListNode)
{
    if xs == Null {

    }else{
        var x := Node(xs.val, Null);
        calc {
            reverseList(reverseList(xs));
            reverseList(reverseList(nodeConcat(x, xs.next)));
            == {ConcatReverseList(x, xs.next);}
            reverseList(nodeConcat(reverseList(xs.next), reverseList(x)));
            reverseList(nodeConcat(reverseList(xs.next), x));
            == {ConcatReverseList(reverseList(xs.next),x);}
            nodeConcat(reverseList(x), reverseList(reverseList(xs.next))); //dafny can figure out the rest from here
            nodeConcat(x, reverseList(reverseList(xs.next)));
            nodeConcat(x, xs.next);
            xs;
        }
    }
}

lemma {:induction false} reversePreservesMultiset<A>(xs: seq<A>) 
{
    if xs == [] {

    }else {
        var x := xs[0];
        reversePreservesMultiset(xs[1..]);
    }
}

lemma  reversePreservesLength<A>(xs: seq<A>)
{

}

lemma  lastReverseIsFirst<A>(xs: seq<A>)
{
    reversePreservesLength(xs);
}

lemma firstReverseIsLast<A>(xs: seq<A>)
{

}

 lemma ReverseConcat<T>(xs: seq<T>, ys: seq<T>)
  {
    // reveal Reverse();
    if |xs| == 0 {
    } else {
    }
  }


lemma reverseRest<A>(xs: seq<A>)
{
    firstReverseIsLast(xs);
    calc {
        reverse(xs);
        reverse(xs[0..|xs|-1] + [xs[|xs|-1]]);
        == {ReverseConcat(xs[0..|xs|-1], [xs[ |xs|-1 ]]);}
        reverse([xs[ |xs|-1 ]]) + reverse(xs[0..|xs|-1]);

    }

}


lemma SeqEq<T>(xs: seq<T>, ys: seq<T>)
{
}

lemma ReverseIndexAll<T>(xs: seq<T>)
{
// reveal Reverse();
}

  lemma ReverseIndex<T>(xs: seq<T>, i: int)
  {
    ReverseIndexAll(xs);
  }

lemma ReverseSingle<A>(xs: seq<A>) 
{

}

lemma reverseReverseIdempotent<A>(xs: seq<A>) 
{
    if xs == [] {

    }else{
        calc {
            reverse(reverse(xs));
            reverse(reverse([xs[0]] + xs[1..]));
            == {ReverseConcat([xs[0]] , xs[1..]);}
            reverse(reverse(xs[1..]) + reverse([xs[0]]));
            == {ReverseSingle([xs[0]]);}
            reverse(reverse(xs[1..]) + [xs[0]]);
            == {ReverseConcat(reverse(xs[1..]), [xs[0]]);}
            reverse([xs[0]]) + reverse(reverse(xs[1..]));
            [xs[0]] + reverse(reverse(xs[1..]));
            == {reverseReverseIdempotent(xs[1..]);}
            xs;
        }
    }
    /* Alternatively */
    // ReverseIndexAll(reverse(xs));
    // ReverseIndexAll(xs);
    // SeqEq(reverse(reverse(xs)), xs);
}

// var x := xs[0];
// assert xs == [x] + xs[1..];
// reversePreservesLength(xs);
// assert |xs| == |reverse(xs)|;
// calc {
//     x;
//     reverse(xs)[|xs|-1];
//     == {firstReverseIsLast(reverse(xs));}
//     reverse(reverse(xs))[0];
// }
// var y := xs[|xs|-1];
// calc{
//     y;
//     == {firstReverseIsLast(xs);}
//     reverse(xs)[0];
// }
// assert xs == xs[0..|xs|-1] + [y];
// lastReverseIsFirst(xs);
// lastReverseIsFirst(reverse(xs));

// assert reverse(reverse(xs))[0] == x;

/*
/**
https://leetcode.com/problems/linked-list-cycle/description/
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function hasCycle(head: ListNode | null): boolean {
    let leader = head;
    let follower = head;
    while(leader !== null) {
        leader = leader.next;
        if(follower && follower.next) {
            follower = follower.next.next;
        }else if(follower && follower.next == null){
            follower=follower.next;
        }
        if(follower == leader && follower != null) return true;
    }
    return false;
};
*/

method test() {
    var cycle := Node(1, Null);
    var next := Node(2, cycle);
    // cycle.next := next;
}
