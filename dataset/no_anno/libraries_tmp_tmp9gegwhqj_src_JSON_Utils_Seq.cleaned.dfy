// RUN: %verify "%s"

module {:options "-functionSyntax:4"} JSON.Utils.Seq {
  lemma Neutral(l: seq)
  {}

  lemma Assoc(a: seq, b: seq, c: seq)
  {}


  lemma Assoc'(a: seq, b: seq, c: seq)
  {}

  lemma Assoc2(a: seq, b: seq, c: seq, d: seq)
  {}
}

