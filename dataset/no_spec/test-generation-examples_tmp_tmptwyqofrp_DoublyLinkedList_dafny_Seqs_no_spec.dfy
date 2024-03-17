module Seqs {
  function last<T>(s:seq<T>) : T
  {
    s[|s|-1]
  }

  function all_but_last<T>(s:seq<T>) : seq<T>
  {
    s[..|s|-1]
  }

  function reverse<T>(s:seq<T>) : seq<T>
  {
    if s == [] then []
    else reverse(s[1..]) + [s[0]]
  }
}

