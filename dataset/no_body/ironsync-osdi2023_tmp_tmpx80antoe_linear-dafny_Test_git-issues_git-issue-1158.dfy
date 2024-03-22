// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

type Id(==)

function F(s: set<Id>): int

lemma Test(x: Id)
{/* TODO */ }

