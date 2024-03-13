module SeqPredicates {
  predicate valueBoundedBy(value : int, min : int, max : int) {
    min <= value < max
  }

  predicate valuesBoundedBy(s: seq<int>, min : int, max: int) {
    (forall el :: el in s ==>
      valueBoundedBy(el, min, max)) &&
    (forall i :: 0 <= i < |s| ==>
      valueBoundedBy(s[i], min, max))
  }

  predicate orderedAsc(s : seq<int>) {
    forall x, y :: 0 <= x < y < |s| ==>
      s[x] < s[y]
  }
}

