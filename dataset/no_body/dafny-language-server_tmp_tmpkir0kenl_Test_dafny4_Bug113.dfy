// RUN: %dafny /compile:3  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype D = D(q:int, r:int, s:int, t:int)

method Main()
{/* TODO */ }
