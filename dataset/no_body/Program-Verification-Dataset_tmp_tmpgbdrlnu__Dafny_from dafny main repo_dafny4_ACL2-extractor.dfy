// RUN: %dafny /compile:0 /deprecation:0 /proverOpt:O:smt.qi.eager_threshold=30 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This is the Extractor Problem from section 11.8 of the ACL2 book,
// "Computer-Aided Reasoning: An Approach" by Kaufmann, Manolios, and
// Moore (2011 edition).

datatype List<T> = Nil | Cons(head: T, tail: List)

ghost function length(xs: List): nat
{
  match xs
  case Nil => 0
  case Cons(_, rest) => 1 + length(rest)
}

// If "0 <= n < length(xs)", then return the element of "xs" that is preceded by
// "n" elements; otherwise, return an arbitrary value.
ghost opaque function nth<T(00)>(n: int, xs: List<T>): T
{
  if 0 <= n < length(xs) then
    nthWorker(n, xs)
  else
    var t :| true; t
}

ghost function nthWorker<T>(n: int, xs: List<T>): T
  requires 0 <= n < length(xs);
{
  if n == 0 then xs.head else nthWorker(n-1, xs.tail)
}

ghost function append(xs: List, ys: List): List
{
  match xs
  case Nil => ys
  case Cons(x, rest) => Cons(x, append(rest, ys))
}

ghost function rev(xs: List): List
{
  match xs
  case Nil => Nil
  case Cons(x, rest) => append(rev(rest), Cons(x, Nil))
}

ghost function nats(n: nat): List<int>
{
  if n == 0 then Nil else Cons(n-1, nats(n-1))
}

ghost function xtr<T(00)>(mp: List<int>, lst: List): List
{
  match mp
  case Nil => Nil
  case Cons(n, rest) => Cons(nth(n, lst), xtr(rest, lst))
}

lemma ExtractorTheorem<T(00)>(xs: List)
  ensures xtr(nats(length(xs)), xs) == rev(xs);
{/* TODO */ }

// auxiliary lemmas and proofs follow

// lemmas about length

lemma XtrLength(mp: List<int>, lst: List)
  ensures length(xtr(mp, lst)) == length(mp);
{/* TODO */ }

lemma NatsLength(n: nat)
  ensures length(nats(n)) == n;
{/* TODO */ }

lemma AppendLength(xs: List, ys: List)
  ensures length(append(xs, ys)) == length(xs) + length(ys);
{/* TODO */ }

lemma RevLength(xs: List)
  ensures length(rev(xs)) == length(xs);
{/* TODO */ }

// you can prove two lists equal by proving their elements equal

lemma EqualElementsMakeEqualLists<T(00)>(xs: List, ys: List)
  requires length(xs) == length(ys)
  requires forall i :: 0 <= i < length(xs) ==> nth(i, xs) == nth(i, ys)
  ensures xs == ys
{/* TODO */ }

// here is the theorem, but applied to the ith element

lemma {:vcs_split_on_every_assert} ExtractorLemma<T(00)>(i: int, xs: List)
  requires 0 <= i < length(xs);
  ensures nth(i, xtr(nats(length(xs)), xs)) == nth(i, rev(xs));
{/* TODO */ }

// lemmas about what nth gives on certain lists

lemma NthXtr<T(00)>(i: int, mp: List<int>, lst: List<T>)
  requires 0 <= i < length(mp);
  ensures nth(i, xtr(mp, lst)) == nth(nth(i, mp), lst);
{/* TODO */ }

lemma NthNats(i: int, n: nat)
  requires 0 <= i < n;
  ensures nth(i, nats(n)) == n - 1 - i;
{/* TODO */ }

lemma NthNatsWorker(i: int, n: nat)
  requires 0 <= i < n && length(nats(n)) == n;
  ensures nthWorker(i, nats(n)) == n - 1 - i;
{/* TODO */ }

lemma NthRev<T(00)>(i: int, xs: List)
  requires 0 <= i < length(xs) == length(rev(xs));
  ensures nthWorker(i, rev(xs)) == nthWorker(length(xs) - 1 - i, xs);
{/* TODO */ }

lemma NthAppendA<T(00)>(i: int, xs: List, ys: List)
  requires 0 <= i < length(xs);
  ensures nth(i, append(xs, ys)) == nth(i, xs);
{/* TODO */ }

lemma NthAppendB<T(00)>(i: int, xs: List, ys: List)
  requires length(xs) <= i < length(xs) + length(ys);
  ensures nth(i, append(xs, ys)) == nth(i - length(xs), ys);
{/* TODO */ }

