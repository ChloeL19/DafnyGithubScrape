// RUN: %dafny /compile:3  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype d = D(m:seq<int>)

method Main()
{/* TODO */ }
