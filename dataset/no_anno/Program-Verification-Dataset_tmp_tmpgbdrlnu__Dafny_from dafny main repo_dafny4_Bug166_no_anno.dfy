// RUN: %dafny /compile:0  /noNLarith /print:"%t.print" /rprint:"%t.rprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

ghost predicate P(x:int)

method test(s:seq<int>)
