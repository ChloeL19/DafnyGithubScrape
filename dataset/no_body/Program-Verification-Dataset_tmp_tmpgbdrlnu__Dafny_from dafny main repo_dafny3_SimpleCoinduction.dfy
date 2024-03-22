// RUN: %testDafnyForEachResolver "%s" -- --warn-deprecation:false


codatatype Stream<T> = Cons(head: T, tail: Stream)
codatatype IList<T> = Nil | ICons(head: T, tail: IList)

// -----------------------------------------------------------------------

greatest predicate Pos(s: Stream<int>)
{
  s.head > 0 && Pos(s.tail)
}

ghost function Up(n: int): Stream<int>
{
  Cons(n, Up(n+1))
}

ghost function Inc(s: Stream<int>): Stream<int>
{
  Cons(s.head + 1, Inc(s.tail))
}

lemma {:induction false} UpLemma(k: nat, n: int)
  ensures Inc(Up(n)) ==#[k] Up(n+1);
{/* TODO */ }

greatest lemma {:induction false} CoUpLemma(n: int)
  ensures Inc(Up(n)) == Up(n+1);
{/* TODO */ }

lemma UpLemma_Auto(k: nat, n: int, nn: int)
  ensures nn == n+1 ==> Inc(Up(n)) ==#[k] Up(nn);  // note: it would be nice to do an automatic rewrite (from "ensures Inc(Up(n)) ==#[k] Up(n+1)") to obtain the good trigger here
{/* TODO */ }

greatest lemma CoUpLemma_Auto(n: int, nn: int)
  ensures nn == n+1 ==> Inc(Up(n)) == Up(nn);  // see comment above
{/* TODO */ }

// -----------------------------------------------------------------------

ghost function Repeat(n: int): Stream<int>
{
  Cons(n, Repeat(n))
}

greatest lemma RepeatLemma(n: int)
  ensures Inc(Repeat(n)) == Repeat(n+1);
{/* TODO */ }

// -----------------------------------------------------------------------

greatest predicate True(s: Stream)
{
  True(s.tail)
}

greatest lemma AlwaysTrue(s: Stream)
  ensures True(s);
{/* TODO */ }

greatest predicate AlsoTrue(s: Stream)
{
  AlsoTrue(s)
}

greatest lemma AlsoAlwaysTrue(s: Stream)
  ensures AlsoTrue(s);
{/* TODO */ }

greatest predicate TT(y: int)
{
  TT(y+1)
}

greatest lemma AlwaysTT(y: int)
  ensures TT(y);
{/* TODO */ }

// -----------------------------------------------------------------------

ghost function Append(M: IList, N: IList): IList
{
  match M
  case Nil => N
  case ICons(x, M') => ICons(x, Append(M', N))
}

ghost function zeros(): IList<int>
{
  ICons(0, zeros())
}

ghost function ones(): IList<int>
{
  ICons(1, ones())
}

greatest predicate AtMost(a: IList<int>, b: IList<int>)
{
  match a
  case Nil => true
  case ICons(h,t) => b.ICons? && h <= b.head && AtMost(t, b.tail)
}

greatest lemma ZerosAndOnes_Theorem0()
  ensures AtMost(zeros(), ones());
{/* TODO */ }

greatest lemma ZerosAndOnes_Theorem1()
  ensures Append(zeros(), ones()) == zeros();
{/* TODO */ }

