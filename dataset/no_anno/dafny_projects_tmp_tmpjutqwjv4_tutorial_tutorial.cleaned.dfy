// Working through https://dafny.org/dafny/OnlineTutorial/guide

function fib(n: nat): nat
{
  if n == 0 then 0
  else if n == 1 then 1
  else fib(n - 1) + fib(n - 2)
}
method ComputeFib(n: nat) returns (ret: nat)
{
  var a := 0;
  var b := 1;
  var i := 0;
  while i < n
    invariant 0 <= i <= n
    invariant a == fib(i)
    invariant b == fib(i+1)
  {
    a, b := b, a+b;
    i := i + 1;
  }
  assert i == n;

  return a;
}

method Find(a: array<int>, key: int) returns (index: int)
{
  index := 0;
  while index < a.Length
    invariant 0 <= index <= a.Length
    invariant forall k :: 0 <= k < index ==> a[k] != key
  {
    if a[index] == key {
      return index;
    }
    index := index + 1;
  }

  return -1;
}

predicate sorted(a: array<int>)
{
  forall n, m :: 0 <= n < m < a.Length ==> a[n] <= a[m]
}

method BinarySearch(a: array<int>, value: int) returns (index: int)
{
  var low := 0;
  var high := a.Length - 1;
  while low < high
    invariant 0 <= low && high < a.Length
    invariant forall k :: 0 <= k < a.Length && (k < low || k > high) ==> a[k] != value
  {
    var mid : int := (low + high) / 2;
    assert 0 <= low <= mid < high < a.Length;
    if a[mid] < value {
      low := mid + 1;
    } else if a[mid] > value {
      high := mid - 1;
    } else {
      assert a[mid] == value;
      return mid;
    }
  }
  if low < a.Length && a[low] == value {
    return low;
  } else {
    return -1;
  }
}


// https://dafny.org/dafny/OnlineTutorial/ValueTypes

function update(s: seq<int>, i: int, v: int): seq<int>
{
  s[..i] + [v] + s[i+1..]
}


// https://dafny.org/dafny/OnlineTutorial/Lemmas

lemma SkippingLemma(a: array<int>, j: int)
{
  var i := j;
  while i < j + a[j] && i < a.Length
    invariant i < a.Length ==> a[i] >= a[j] - (i-j)
    invariant forall k :: j <= k < i && k < a.Length ==> a[k] != 0
  {
    i := i + 1;
  }
}

method FindZero(a: array<int>) returns (index: int)
{
  index := 0;
  while index < a.Length
    invariant 0 <= index
    invariant forall k :: 0 <= k < index && k < a.Length ==> a[k] != 0
  {
    if a[index] == 0 { return; }
    SkippingLemma(a, index);
    index := index + a[index];
  }
  index := -1;
}


function count(a: seq<bool>): nat
{
  if |a| == 0 then 0 else
  (if a[0] then 1 else 0) + count(a[1..])
}

lemma DistributiveLemma(a: seq<bool>, b: seq<bool>)
{
  if a == [] {
    assert a+b == b;
  } else {
    // Unnecessary! DistributiveLemma(a[1..], b);
    assert a + b == [a[0]] + (a[1..] + b);
  }
}


class Node
{
  var next: seq<Node>
}
predicate closed(graph: set<Node>)
{
  forall i :: i in graph ==> forall k :: 0 <= k < |i.next| ==> i.next[k] in graph && i.next[k] != i
}
predicate path(p: seq<Node>, graph: set<Node>)
{
  p[0] in graph &&
    (|p| > 1 ==> p[1] in p[0].next && // the first link is valid, if it exists
     path(p[1..], graph)) // and the rest of the sequence is a valid
}
predicate pathSpecific(p: seq<Node>, start: Node, end: Node, graph: set<Node>)
{
  0 < |p| && // path is nonempty
  start == p[0] && end == p[|p|-1] && // it starts and ends correctly
  path(p, graph) // and it is a valid path
}

lemma DisproofLemma(p: seq<Node>, subgraph: set<Node>,
{
  if |p| >= 2 && p[0] == root && p[1] in p[0].next {
    DisproofLemma(p[1..], subgraph, p[1], goal, graph);
  }
}

lemma ClosedLemma(subgraph: set<Node>, root: Node, goal: Node, graph: set<Node>)
{
  forall p { DisproofLemma(p, subgraph, root, goal, graph); }
}

