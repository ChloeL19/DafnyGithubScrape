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
{
  if (k != 0) {
    UpLemma(k-1, n+1);
  }
}

greatest lemma {:induction false} CoUpLemma(n: int)
{
  CoUpLemma(n+1);
}

lemma UpLemma_Auto(k: nat, n: int, nn: int)
{
}

greatest lemma CoUpLemma_Auto(n: int, nn: int)
{
}

// -----------------------------------------------------------------------

ghost function Repeat(n: int): Stream<int>
{
  Cons(n, Repeat(n))
}

greatest lemma RepeatLemma(n: int)
{
}

// -----------------------------------------------------------------------

greatest predicate True(s: Stream)
{
  True(s.tail)
}

greatest lemma AlwaysTrue(s: Stream)
{
}

greatest predicate AlsoTrue(s: Stream)
{
  AlsoTrue(s)
}

greatest lemma AlsoAlwaysTrue(s: Stream)
{
}

greatest predicate TT(y: int)
{
  TT(y+1)
}

greatest lemma AlwaysTT(y: int)
{
}

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
{
}

greatest lemma ZerosAndOnes_Theorem1()
{
}

