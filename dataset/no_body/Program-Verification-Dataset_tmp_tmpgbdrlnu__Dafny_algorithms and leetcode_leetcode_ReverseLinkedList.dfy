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
    ensures xs == nodeConcat(xs, Null)
{/* TODO */ }

lemma ConcatNullIsLeftIdentity(xs: ListNode) 
    ensures xs == nodeConcat(Null, xs)
{/* TODO */ }

lemma ConcatExtensionality(xs: ListNode)
    requires xs != Null
    ensures nodeConcat(Node(xs.val, Null), xs.next) == xs;
{/* TODO */ }

lemma ConcatAssociative(xs: ListNode, ys: ListNode, zs: ListNode)
    ensures nodeConcat(nodeConcat(xs, ys), zs) == nodeConcat(xs, nodeConcat(ys, zs))
{/* TODO */ }

lemma reverseSingleList(xs: ListNode) 
    requires xs != Null;
    requires xs.next == Null;
    ensures reverseList(xs) == xs;
{/* TODO */ }



lemma {:verify true} ConcatReverseList(xs:ListNode, ys: ListNode) 
    ensures reverseList(nodeConcat(xs,ys)) == nodeConcat(reverseList(ys), reverseList(xs))
    decreases xs;
{/* TODO */ }

lemma reverseReverseListIsIdempotent(xs: ListNode)
    ensures reverseList(reverseList(xs)) == xs
{/* TODO */ }

lemma {:induction false} reversePreservesMultiset<A>(xs: seq<A>) 
    ensures multiset(xs) == multiset(reverse(xs))
{/* TODO */ }

lemma  reversePreservesLength<A>(xs: seq<A>)
    ensures |xs| == |reverse(xs)|
{/* TODO */ }

lemma  lastReverseIsFirst<A>(xs: seq<A>)
    requires |xs| > 0
    ensures xs[0] == reverse(xs)[|reverse(xs)|-1]
{/* TODO */ }

lemma firstReverseIsLast<A>(xs: seq<A>)
    requires |xs| > 0
    ensures reverse(xs)[0] == xs[|xs|-1]
{/* TODO */ }

 lemma ReverseConcat<T>(xs: seq<T>, ys: seq<T>)
    ensures reverse(xs + ys) == reverse(ys) + reverse(xs)
  {/* TODO */ }


lemma reverseRest<A>(xs: seq<A>)
    requires |xs| > 0
    ensures reverse(xs) == [xs[ |xs| -1 ] ] + reverse(xs[0..|xs|-1])
{/* TODO */ }


lemma SeqEq<T>(xs: seq<T>, ys: seq<T>)
    requires |xs| == |ys|
    requires forall i :: 0 <= i < |xs| ==> xs[i] == ys[i]
    ensures xs == ys
{/* TODO */ }

lemma ReverseIndexAll<T>(xs: seq<T>)
    ensures |reverse(xs)| == |xs|
    ensures forall i :: 0 <= i < |xs| ==> reverse(xs)[i] == xs[|xs| - i - 1]
{/* TODO */ }

  lemma ReverseIndex<T>(xs: seq<T>, i: int)
    requires 0 <= i < |xs|
    ensures |reverse(xs)| == |xs|
    ensures reverse(xs)[i] == xs[|xs| - i - 1]
  {/* TODO */ }

lemma ReverseSingle<A>(xs: seq<A>) 
    requires |xs| == 1
    ensures reverse(xs) == xs
{/* TODO */ }

lemma reverseReverseIdempotent<A>(xs: seq<A>) 
    ensures reverse(reverse(xs)) == xs
{/* TODO */ }

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

method test() {/* TODO */ }
