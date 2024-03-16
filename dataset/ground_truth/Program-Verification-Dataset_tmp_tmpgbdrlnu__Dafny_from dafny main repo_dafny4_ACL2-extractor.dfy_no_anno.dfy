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
{
  var a, b := xtr(nats(length(xs)), xs), rev(xs);
  calc {
    length(a);
    { XtrLength(nats(length(xs)), xs); }
    length(nats(length(xs)));
    { NatsLength(length(xs)); }
    length(xs);
  }
  calc {
    length(xs);
    { RevLength(xs); }
    length(b);
  }
  forall i | 0 <= i < length(xs)
  {
    reveal nth();
    ExtractorLemma(i, xs);
  }
  EqualElementsMakeEqualLists(a, b);
}

// auxiliary lemmas and proofs follow

// lemmas about length

lemma XtrLength(mp: List<int>, lst: List)
{
}

lemma NatsLength(n: nat)
{
}

lemma AppendLength(xs: List, ys: List)
{
}

lemma RevLength(xs: List)
{
  match xs {
    case Nil =>
    case Cons(x, rest) =>
      calc {
        length(append(rev(rest), Cons(x, Nil)));
        { AppendLength(rev(rest), Cons(x, Nil)); }
        length(rev(rest)) + length(Cons(x, Nil));
        length(rev(rest)) + 1;
      }
  }
}

// you can prove two lists equal by proving their elements equal

lemma EqualElementsMakeEqualLists<T(00)>(xs: List, ys: List)
{
  reveal nth();
  match xs {
    case Nil =>
    case Cons(x, rest) =>
      {
        calc {
          nth(i, xs.tail) == nth(i, ys.tail);
          nth(i+1, Cons(xs.head, xs.tail)) == nth(i+1, Cons(ys.head, ys.tail));
          nth(i+1, xs) == nth(i+1, ys);
        }
      }
      // EqualElementsMakeEqualLists(xs.tail, ys.tail);
  }
}

// here is the theorem, but applied to the ith element

lemma {:vcs_split_on_every_assert} ExtractorLemma<T(00)>(i: int, xs: List)
{
  calc {
    nth(i, xtr(nats(length(xs)), xs));
    { NatsLength(length(xs));
      NthXtr(i, nats(length(xs)), xs); }
    nth(nth(i, nats(length(xs))), xs);
    { NthNats(i, length(xs)); }
    nth(length(xs) - 1 - i, xs);
    { reveal nth(); RevLength(xs); NthRev(i, xs); }
    nth(i, rev(xs));
  }
}

// lemmas about what nth gives on certain lists

lemma NthXtr<T(00)>(i: int, mp: List<int>, lst: List<T>)
{
  reveal nth();
  XtrLength(mp, lst);
  if i == 0 {
  } else {
    calc {
      nth(i-1, xtr(mp, lst).tail);
      // def. xtr
      nth(i-1, xtr(mp.tail, lst));
      { NthXtr(i-1, mp.tail, lst); }
      nth(nth(i-1, mp.tail), lst);
    }
  }
}

lemma NthNats(i: int, n: nat)
{
  reveal nth();
  NatsLength(n);
  NthNatsWorker(i, n);
}

lemma NthNatsWorker(i: int, n: nat)
{
}

lemma NthRev<T(00)>(i: int, xs: List)
{
  reveal nth();
  RevLength(xs.tail);
  if i < length(rev(xs.tail)) {
    calc {
      nth(i, rev(xs));
      nthWorker(i, rev(xs));
      // def. rev
      nthWorker(i, append(rev(xs.tail), Cons(xs.head, Nil)));
      { NthAppendA(i, rev(xs.tail), Cons(xs.head, Nil)); }
      nthWorker(i, rev(xs.tail));
      { NthRev(i, xs.tail); }  // induction hypothesis
      nthWorker(length(xs.tail) - 1 - i, xs.tail);
      // def. nthWorker
      nthWorker(length(xs.tail) - 1 - i + 1, xs);
      nthWorker(length(xs) - 1 - i, xs);
    }
  } else {
    calc {
      nth(i, rev(xs));
      nthWorker(i, rev(xs));
      // def. rev
      nthWorker(i, append(rev(xs.tail), Cons(xs.head, Nil)));
      { NthAppendB(i, rev(xs.tail), Cons(xs.head, Nil)); }
      nthWorker(i - length(rev(xs.tail)), Cons(xs.head, Nil));
      nthWorker(0, Cons(xs.head, Nil));
      nthWorker(0, xs);
      nthWorker(length(xs) - 1 - length(xs.tail), xs);
      { RevLength(xs.tail); }
      nthWorker(length(xs) - 1 - length(rev(xs.tail)), xs);
      nth(length(xs) - 1 - length(rev(xs.tail)), xs);
      nth(length(xs) - 1 - i, xs);
    }
  }
}

lemma NthAppendA<T(00)>(i: int, xs: List, ys: List)
{
  reveal nth();
  if i == 0 {
    calc {
      nth(0, append(xs, ys));
      nth(0, Cons(xs.head, append(xs.tail, ys)));
      xs.head;
    }
  } else {
    calc {
      nth(i, append(xs, ys));
      nth(i, Cons(xs.head, append(xs.tail, ys)));
      nth(i-1, append(xs.tail, ys));
      { NthAppendA(i-1, xs.tail, ys); }
      nth(i-1, xs.tail);
    }
  }
}

lemma NthAppendB<T(00)>(i: int, xs: List, ys: List)
{
  reveal nth();
  AppendLength(xs, ys);
  match xs {
    case Nil =>
      calc {
        nth(i, append(xs, ys));
        nth(i, append(Cons(x, rest), ys));
        // def. append
        nth(i, Cons(x, append(rest, ys)));
        nth(i-1, append(rest, ys));
        { NthAppendB(i-1, rest, ys); }
        nth(i-1 - length(rest), ys);
      }
  }
}

