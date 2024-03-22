// RUN: %dafny /warnShadowing /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma L(x:int)
{/* TODO */ }

lemma {:warnShadowing false} L1(x:int)
{/* TODO */ }

