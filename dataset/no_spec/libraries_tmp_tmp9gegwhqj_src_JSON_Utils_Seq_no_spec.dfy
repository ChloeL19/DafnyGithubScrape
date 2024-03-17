// RUN: %verify "%s"

module {:options "-functionSyntax:4"} JSON.Utils.Seq {
  lemma Neutral(l: seq)
  {}

  lemma Assoc(a: seq, b: seq, c: seq)
    // `a + b + c` is parsed as `(a + b) + c`
  {}


  lemma Assoc'(a: seq, b: seq, c: seq)
    // `a + b + c` is parsed as `(a + b) + c`
  {}

  lemma Assoc2(a: seq, b: seq, c: seq, d: seq)
    // `a + b + c + d` is parsed as `((a + b) + c) + d`
  {}
}

