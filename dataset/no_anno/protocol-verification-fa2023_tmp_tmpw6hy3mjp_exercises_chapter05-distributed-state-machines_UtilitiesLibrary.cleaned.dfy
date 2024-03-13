module UtilitiesLibrary {
  function DropLast<T>(theSeq: seq<T>) : seq<T>
  {
    theSeq[..|theSeq|-1]
  }

  function Last<T>(theSeq: seq<T>) : T
  {
    theSeq[|theSeq|-1]
  }

  datatype Option<T> = Some(value:T) | None
}

