// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype PartRealPartGhost = PartRealPartGhost(x:int, ghost y:int)

method UpdateField()
{/* TODO */ }

