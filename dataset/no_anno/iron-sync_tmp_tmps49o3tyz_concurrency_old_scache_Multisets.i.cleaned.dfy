module MultisetUtil {
  function Count<A>(fn: A ~> bool, s: multiset<A>) : nat
  function Sum<A>(fn: A ~> int, s: multiset<A>) : int
  lemma Count_ge_1<A>(fn: A -> bool, s: multiset<A>, v: A)
  lemma Count_ge_2<A>(fn: A -> bool, s: multiset<A>, v: A, w: A)
  lemma get_nonzero_elem<A>(fn: A -> int, s: multiset<A>)
  lemma get_true_elem<A>(fn: A -> bool, s: multiset<A>)
  lemma get_2_true_elems<A>(fn: A -> bool, s: multiset<A>)
  ensures multiset{v, w} <= s
  ensures fn(v)
  ensures fn(w)

  lemma SumAdditive<A>(fn: A -> int, s: multiset<A>, t: multiset<A>)
  lemma SumMultiset1<A>(fn: A -> int, v: A)
  ensures Sum(fn, multiset{v}) == fn(v)

  lemma CountAdditive<A>(fn: A -> bool, s: multiset<A>, t: multiset<A>)
  lemma CountMultiset1<A>(fn: A -> bool, v: A)
  ensures fn(v) ==> Count(fn, multiset{v}) == 1
  ensures !fn(v) ==> Count(fn, multiset{v}) == 0

  lemma CountSubset<A>(fn: A -> bool, fn2: A -> bool, t: multiset<A>)
