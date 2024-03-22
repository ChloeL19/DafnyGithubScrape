// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate P(e:int, p:int) { true }
predicate Q(i:int, t:int)

lemma Tester(x:int)
{/* TODO */ }

