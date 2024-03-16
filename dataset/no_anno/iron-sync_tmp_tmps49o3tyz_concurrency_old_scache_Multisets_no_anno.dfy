module MultisetUtil {
  function Count<A>(fn: A ~> bool, s: multiset<A>) : nat

  function Sum<A>(fn: A ~> int, s: multiset<A>) : int

  lemma Count_ge_1<A>(fn: A -> bool, s: multiset<A>, v: A)
}

