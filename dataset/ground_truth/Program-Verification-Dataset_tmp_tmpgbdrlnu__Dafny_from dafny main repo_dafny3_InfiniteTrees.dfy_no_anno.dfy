// RUN: %dafny /compile:0 /deprecation:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// Here is the usual definition of possibly infinite lists, along with a function Tail(s, n), which drops
// n heads from s, and two lemmas that prove properties of Tail.

codatatype Stream<T> = Nil | Cons(head: T, tail: Stream)

ghost function Tail(s: Stream, n: nat): Stream
{
  if n == 0 then s else
    var t := Tail(s, n-1);
    if t == Nil then t else t.tail
}

lemma Tail_Lemma0(s: Stream, n: nat)
{
}
lemma Tail_Lemma1(s: Stream, k: nat, n: nat)
{
  if k < n && Tail(s, n).Cons? {
  }
}
lemma Tail_Lemma2(s: Stream, n: nat)
{
  if n != 0 {
    Tail_Lemma0(s, n-1);
  }
}

// Co-predicate IsNeverEndingStream(s) answers whether or not s ever contains Nil.

greatest predicate IsNeverEndingStream<S>(s: Stream<S>)
{
  match s
  case Nil => false
  case Cons(_, tail) => IsNeverEndingStream(tail)
}

// Here is an example of an infinite stream.

ghost function AnInfiniteStream(): Stream<int>
{
  Cons(0, AnInfiniteStream())
}
greatest lemma Proposition0()
{
}

// Now, consider a Tree definition, where each node can have a possibly infinite number of children.

datatype Tree = Node(children: Stream<Tree>)

// Such a tree might have not just infinite width but also infinite height.  The following predicate
// holds if there is, for every path down from the root, a common bound on the height of each such path.
// Note that the definition needs a co-predicate in order to say something about all of a node's children.

ghost predicate HasBoundedHeight(t: Tree)
{
  exists n :: 0 <= n && LowerThan(t.children, n)
}
greatest predicate LowerThan(s: Stream<Tree>, n: nat)
{
  match s
  case Nil => true
  case Cons(t, tail) =>
    1 <= n && LowerThan(t.children, n-1) && LowerThan(tail, n)
}

// Co-predicate LowerThan(s, n) recurses on LowerThan(s.tail, n).  Thus, a property of LowerThan is that
// LowerThan(s, h) implies LowerThan(s', h) for any suffix s' of s.

lemma LowerThan_Lemma(s: Stream<Tree>, n: nat, h: nat)
{
  Tail_Lemma1(s, 0, n);
  if n == 0 || Tail(s, n) == Nil {
  } else {
    match s {
      case Cons(t, tail) =>
        LowerThan_Lemma(tail, n-1, h);
        Tail_Lemma0(s, n-1);
    }
  }
}

// A tree t where every node has an infinite number of children satisfies InfiniteEverywhere(t.children).
// Otherwise, IsFiniteSomewhere(t) holds.  That is, IsFiniteSomewhere says that the tree has some node
// with less than infinite width.  Such a tree may or may not be of finite height, as we'll see in an
// example below.

ghost predicate IsFiniteSomewhere(t: Tree)
{
  !InfiniteEverywhere(t.children)
}
greatest predicate InfiniteEverywhere(s: Stream<Tree>)
{
  match s
  case Nil => false
  case Cons(t, tail) => InfiniteEverywhere(t.children) && InfiniteEverywhere(tail)
}

// Here is a tree where every node has exactly 1 child.  Such a tree is finite in width (which implies
// it is finite somewhere) and infinite in height (which implies there is no bound on its height).

ghost function SkinnyTree(): Tree
{
  Node(Cons(SkinnyTree(), Nil))
}
lemma Proposition1()
{
}

// Any tree where all paths have bounded height are finite somewhere.

lemma Theorem0(t: Tree)
{
  var n :| 0 <= n && LowerThan(t.children, n);
  /*
  var k := FindNil(t.children, n);
}
lemma FindNil(s: Stream<Tree>, n: nat) returns (k: nat)
{
  match s {
    case Nil => k := 1;
    case Cons(t, _) =>
	  k := FindNil(t.children, n-1);
	  k := k + 1;
  }
}

// We defined an InfiniteEverywhere property above and negated it to get an IsFiniteSomewhere predicate.
// If we had an InfiniteHeightSomewhere property, then we could negate it to obtain a predicate
// HasFiniteHeightEverywhere.  Consider the following definitions:

ghost predicate HasFiniteHeightEverywhere_Bad(t: Tree)
{
  !InfiniteHeightSomewhere_Bad(t.children)
}
greatest predicate InfiniteHeightSomewhere_Bad(s: Stream<Tree>)
{
  match s
  case Nil => false
  case Cons(t, tail) => InfiniteHeightSomewhere_Bad(t.children) || InfiniteHeightSomewhere_Bad(tail)
}

// In some ways, this definition may look reasonable--a list of trees is infinite somewhere
// if it is nonempty, and either the list of children of the first node satisfies the property
// or the tail of the list does.  However, because co-predicates are defined by greatest
// fix-points, there is nothing in this definition that "forces" the list to ever get to a
// node whose list of children satisfy the property.  The following example shows that a
// shallow, infinitely wide tree satisfies the negation of HasFiniteHeightEverywhere_Bad.

ghost function ATree(): Tree
{
  Node(ATreeChildren())
}
ghost function ATreeChildren(): Stream<Tree>
{
  Cons(Node(Nil), ATreeChildren())
}
lemma Proposition2()
{
  Proposition2_Lemma0();
  Proposition2_Lemma1(ATreeChildren());
}
greatest lemma Proposition2_Lemma0()
{
}
greatest lemma Proposition2_Lemma1(s: Stream<Tree>)
{
  calc {
    InfiniteHeightSomewhere_Bad#[_k](s);
    InfiniteHeightSomewhere_Bad#[_k-1](s.head.children) || InfiniteHeightSomewhere_Bad#[_k-1](s.tail);
  <==
    InfiniteHeightSomewhere_Bad#[_k-1](s.tail);  // induction hypothesis
  }
}

// What was missing from the InfiniteHeightSomewhere_Bad definition was the existence of a child
// node that satisfies the property recursively.  To address that problem, we may consider
// a definition like the following:

/*
ghost predicate HasFiniteHeightEverywhere_Attempt(t: Tree)
{
  !InfiniteHeightSomewhere_Attempt(t.children)
}
greatest predicate InfiniteHeightSomewhere_Attempt(s: Stream<Tree>)
{
  exists n ::
    0 <= n &&
    var ch := Tail(s, n);
    ch.Cons? && InfiniteHeightSomewhere_Attempt(ch.head.children)
}
*/

// However, Dafny does not allow this definition:  the recursive call to InfiniteHeightSomewhere_Attempt
// sits inside an unbounded existential quantifier, which means the co-predicate's connection with its prefix
// predicate is not guaranteed to hold, so Dafny disallows this co-predicate definition.

// We will use a different way to express the HasFiniteHeightEverywhere property.  Instead of
// using an existential quantifier inside the recursively defined co-predicate, we can place a "larger"
// existential quantifier outside the call to the co-predicate.  This existential quantifier is going to be
// over the possible paths down the tree (it is "larger" in the sense that it selects a child tree at each
// level down the path, not just at one level).

// A path is a possibly infinite list of indices, each selecting the next child tree to navigate to.  A path
// is valid when it uses valid indices and does not stop at a node with children.

greatest predicate ValidPath(t: Tree, p: Stream<int>)
{
  match p
  case Nil => t == Node(Nil)
  case Cons(index, tail) =>
    0 <= index &&
    var ch := Tail(t.children, index);
    ch.Cons? && ValidPath(ch.head, tail)
}
lemma ValidPath_Lemma(p: Stream<int>)
{
  if ValidPath(Node(Nil), p) {
    match p {
      case Nil =>
      case Cons(index, tail) =>  // proof by contradiction
        var nil : Stream<Tree> := Nil;
        Tail_Lemma1(nil, 0, index);
    }
  }
}

// A tree has finite height (everywhere) if it has no valid infinite paths.

ghost predicate HasFiniteHeight(t: Tree)
{
  forall p :: ValidPath(t, p) ==> !IsNeverEndingStream(p)
}

// From this definition, we can prove that any tree of bounded height is also of finite height.

lemma Theorem1(t: Tree)
{
  var n :| 0 <= n && LowerThan(t.children, n);
  forall p | ValidPath(t, p) {
    Theorem1_Lemma(t, n, p);
  }
}
lemma Theorem1_Lemma(t: Tree, n: nat, p: Stream<int>)
  decreases n;
{
  match p {
    case Nil =>
    case Cons(index, tail) =>
      var ch := Tail(t.children, index);
      calc {
        LowerThan(t.children, n);
      ==>  { LowerThan_Lemma(t.children, index, n); }
        LowerThan(ch, n);
      ==>  // def. LowerThan
        LowerThan(ch.head.children, n-1);
      ==>  //{ Theorem1_Lemma(ch.head, n-1, tail); }
        !IsNeverEndingStream(tail);
      ==>  // def. IsNeverEndingStream
        !IsNeverEndingStream(p);
      }
  }
}

// In fact, HasBoundedHeight is strictly strong than HasFiniteHeight, as we'll show with an example.
// Define SkinnyFiniteTree(n) to be a skinny (that is, of width 1) tree of height n.

ghost function SkinnyFiniteTree(n: nat): Tree
{
  if n == 0 then Node(Nil) else Node(Cons(SkinnyFiniteTree(n-1), Nil))
}

// Next, we define a tree whose root has an infinite number of children, child i of which
// is a SkinnyFiniteTree(i).

ghost function FiniteUnboundedTree(): Tree
{
  Node(EverLongerSkinnyTrees(0))
}
ghost function EverLongerSkinnyTrees(n: nat): Stream<Tree>
{
  Cons(SkinnyFiniteTree(n), EverLongerSkinnyTrees(n+1))
}

lemma EverLongerSkinnyTrees_Lemma(k: nat, n: nat)
  decreases n;
{
  if n == 0 {
  } else {
    calc {
      Tail(EverLongerSkinnyTrees(k), n);
      { EverLongerSkinnyTrees_Lemma(k, n-1); }  // this ensures that .tail on the next line is well-defined
      Tail(EverLongerSkinnyTrees(k), n-1).tail;
      { Tail_Lemma0(EverLongerSkinnyTrees(k), n-1); }
      Tail(EverLongerSkinnyTrees(k).tail, n-1);
      Tail(EverLongerSkinnyTrees(k+1), n-1);
    }
    EverLongerSkinnyTrees_Lemma(k+1, n-1);
  }
}

lemma Proposition3()
{
  Proposition3a();
  Proposition3b();
}
lemma Proposition3a()
{
  var ch := FiniteUnboundedTree().children;
  forall n | 0 <= n
  {
    var cn := Tail(ch, n+1);
    EverLongerSkinnyTrees_Lemma(0, n+1);
    LowerThan_Lemma(ch, n+1, n);
  }
}
lemma Proposition3b()
{
  var t := FiniteUnboundedTree();
  forall p | ValidPath(t, p)
  {
    var index := p.head;
    var ch := Tail(t.children, index);
    EverLongerSkinnyTrees_Lemma(0, index);
    var si := SkinnyFiniteTree(index);
    Proposition3b_Lemma(si, index, p.tail);
  }
}
lemma Proposition3b_Lemma(t: Tree, h: nat, p: Stream<int>)
{
  match p {
    case Nil =>
    case Cons(index, tail) =>
      // From the definition of ValidPath(t, p), we get the following:
      var ch := Tail(t.children, index);
      // assert ch.Cons? && ValidPath(ch.head, tail);
      // From the definition of LowerThan(t.children, h), we get the following:
      match t.children {
        case Nil =>
          ValidPath_Lemma(p);
          // assert 1 <= h;
          LowerThan_Lemma(t.children, index, h);
          // assert LowerThan(ch, h);
      }
      // Putting these together, by ch.Cons? and the definition of LowerThan(ch, h), we get:
      // Proposition3b_Lemma(ch.head, h-1, tail);
  }
}

// Using a stream of integers to denote a path is convenient, because it allows us to
// use Tail to quickly select the next child tree.  But we can also define paths in a
// way that more directly follows the navigation steps required to get to the next child,
// using Peano numbers instead of the built-in integers.  This means that each Succ
// constructor among the Peano numbers corresponds to moving "right" among the children
// of a tree node.  A path is valid only if it always selects a child from a list
// of children; this implies we must avoid infinite "right" moves.  The appropriate type
// Numbers (which is really just a stream of natural numbers) is defined as a combination
// two mutually recursive datatypes, one inductive and the other co-inductive.

codatatype CoOption<T> = None | Some(get: T)
datatype Number = Succ(Number) | Zero(CoOption<Number>)

// Note that the use of an inductive datatype for Number guarantees that sequences of successive
// "right" moves are finite (analogously, each Peano number is finite).  Yet the use of a co-inductive
// CoOption in between allows paths to go on forever.  In contrast, a definition like:

codatatype InfPath = Right(InfPath) | Down(InfPath) | Stop

// does not guarantee the absence of infinitely long sequences of "right" moves.  In other words,
// InfPath also gives rise to indecisive paths--those that never select a child node.  Also,
// compare the definition of Number with:

codatatype FinPath = Right(FinPath) | Down(FinPath) | Stop

// where the type can only represent finite paths.  As a final alternative to consider, had we
// wanted only infinite, decisive paths, we would just drop the None constructor, forcing each
// CoOption to be some Number.  As it is, we want to allow both finite and infinite paths, but we
// want to be able to distinguish them, so we define a co-predicate that does so:

greatest predicate InfinitePath(r: CoOption<Number>)
{
  match r
  case None => false
  case Some(num) => InfinitePath'(num)
}
greatest predicate InfinitePath'(num: Number)
{
  match num
  case Succ(next) => InfinitePath'(next)
  case Zero(r) => InfinitePath(r)
}

// As before, a path is valid for a tree when it navigates to existing nodes and does not stop
// in a node with more children.

greatest predicate ValidPath_Alt(t: Tree, r: CoOption<Number>)
{
  match r
  case None => t == Node(Nil)
  case Some(num) => ValidPath_Alt'(t.children, num)
}
greatest predicate ValidPath_Alt'(s: Stream<Tree>, num: Number)
{
  match num
  case Succ(next) => s.Cons? && ValidPath_Alt'(s.tail, next)
  case Zero(r) => s.Cons? && ValidPath_Alt(s.head, r)
}

// Here is the alternative definition of a tree that has finite height everywhere, using the
// new paths.

ghost predicate HasFiniteHeight_Alt(t: Tree)
{
  forall r :: ValidPath_Alt(t, r) ==> !InfinitePath(r)
}

// We will prove that this new definition is equivalent to the previous.  To do that, we
// first definite functions S2N and N2S to map between the path representations
// Stream<int> and CoOption<Number>, and then prove some lemmas about this correspondence.

ghost function S2N(p: Stream<int>): CoOption<Number>
  decreases 0;
{
  match p
  case Nil => None
  case Cons(n, tail) => Some(S2N'(if n < 0 then 0 else n, tail))
}
ghost function S2N'(n: nat, tail: Stream<int>): Number
  decreases n + 1;
{
  if n <= 0 then Zero(S2N(tail)) else Succ(S2N'(n-1, tail))
}

ghost function N2S(r: CoOption<Number>): Stream<int>
{
  match r
  case None => Nil
  case Some(num) => N2S'(0, num)
}
ghost function N2S'(n: nat, num: Number): Stream<int>
  decreases num;
{
  match num
  case Zero(r) => Cons(n, N2S(r))
  case Succ(next) => N2S'(n + 1, next)
}

lemma Path_Lemma0(t: Tree, p: Stream<int>)
{
  if ValidPath(t, p) {
    Path_Lemma0'(t, p);
  }
}
greatest lemma Path_Lemma0'(t: Tree, p: Stream<int>)
{
  match p {
    case Nil =>
      var ch := Tail(t.children, index);
      calc {
        ValidPath_Alt#[_k](t, S2N(p));
        { assert S2N(p) == Some(S2N'(index, tail)); }
        ValidPath_Alt#[_k](t, Some(S2N'(index, tail)));
        // def. ValidPath_Alt#
        ValidPath_Alt'#[_k-1](t.children, S2N'(index, tail));
        { Path_Lemma0''(t.children, index, tail); }
        true;
      }
  }
}
greatest lemma Path_Lemma0''(tChildren: Stream<Tree>, n: nat, tail: Stream<int>)
{
  Tail_Lemma1(tChildren, 0, n);
  match S2N'(n, tail) {
    case Succ(next) =>
      calc {
        Tail(tChildren, n);
        { Tail_Lemma1(tChildren, n-1, n); }
        Tail(tChildren, n-1).tail;
        { Tail_Lemma0(tChildren, n-1); }
        Tail(tChildren.tail, n-1);
      }
      Path_Lemma0''(tChildren.tail, n-1, tail);
    case Zero(r) =>
      Path_Lemma0'(tChildren.head, tail);
  }
}
lemma Path_Lemma1(t: Tree, r: CoOption<Number>)
{
  if ValidPath_Alt(t, r) {
    Path_Lemma1'(t, r);
  }
}
greatest lemma Path_Lemma1'(t: Tree, r: CoOption<Number>)
  decreases 1;
{
  match r {
    case None =>
      // assert N2S'(0, num).Cons?;
      // Path_Lemma1''(t.children, 0, num);
      var p := N2S'(0, num);
      calc {
        ValidPath#[_k](t, N2S(r));
        ValidPath#[_k](t, N2S(Some(num)));
        ValidPath#[_k](t, N2S'(0, num));
        { Path_Lemma1''#[_k](t.children, 0, num); }
        true;
      }
  }
}
greatest lemma Path_Lemma1''(s: Stream<Tree>, n: nat, num: Number)
  decreases 0, num;
{
  match num {
    case Succ(next) =>
      Path_Lemma1''#[_k](s, n+1, next);
    case Zero(r) =>
      calc {
        ValidPath#[_k](Node(s), N2S'(n, num));
        ValidPath#[_k](Node(s), Cons(n, N2S(r)));
        Tail(s, n).Cons? && ValidPath#[_k-1](Tail(s, n).head, N2S(r));
        { assert Tail(s, n).Cons?; }
        ValidPath#[_k-1](Tail(s, n).head, N2S(r));
        { Path_Lemma1'(Tail(s, n).head, r); }
        true;
      }
  }
}
lemma Path_Lemma2(p: Stream<int>)
{
  if IsNeverEndingStream(p) {
    Path_Lemma2'(p);
  }
}
greatest lemma Path_Lemma2'(p: Stream<int>)
{
  match p {
  case Cons(n, tail) =>
    calc {
      InfinitePath#[_k](S2N(p));
      // def. S2N
      InfinitePath#[_k](Some(S2N'(if n < 0 then 0 else n, tail)));
      // def. InfinitePath
      InfinitePath'#[_k-1](S2N'(if n < 0 then 0 else n, tail));
    <== { Path_Lemma2''(p, if n < 0 then 0 else n, tail); }
      InfinitePath#[_k-1](S2N(tail));
      { Path_Lemma2'(tail); }
      true;
    }
  }
}
greatest lemma Path_Lemma2''(p: Stream<int>, n: nat, tail: Stream<int>)
{
  Path_Lemma2'(tail);
}
lemma Path_Lemma3(r: CoOption<Number>)
{
  if InfinitePath(r) {
    match r {
      case Some(num) => Path_Lemma3'(0, num);
    }
  }
}
greatest lemma Path_Lemma3'(n: nat, num: Number)
  decreases num;
{
  match num {
    case Zero(r) =>
      calc {
        IsNeverEndingStream#[_k](N2S'(n, num));
        // def. N2S'
        IsNeverEndingStream#[_k](Cons(n, N2S(r)));
        // def. IsNeverEndingStream
        IsNeverEndingStream#[_k-1](N2S(r));
        { Path_Lemma3'(0, r.get); }
        true;
      }
    case Succ(next) =>
      Path_Lemma3'#[_k](n + 1, next);
  }
}

lemma Theorem2(t: Tree)
{
  if HasFiniteHeight_Alt(t) {
    forall p {
      calc ==> {
        ValidPath(t, p);
        { Path_Lemma0(t, p); }
        ValidPath_Alt(t, S2N(p));
        // assumption HasFiniteHeight(t)
        !InfinitePath(S2N(p));
        { Path_Lemma2(p); }
        !IsNeverEndingStream(p);
      }
    }
  }
  if HasFiniteHeight(t) {
    forall r {
      calc ==> {
        ValidPath_Alt(t, r);
        { Path_Lemma1(t, r); }
        ValidPath(t, N2S(r));
        // assumption HasFiniteHeight_Alt(t)
        !IsNeverEndingStream(N2S(r));
        { Path_Lemma3(r); }
        !InfinitePath(r);
      }
    }
  }
}

