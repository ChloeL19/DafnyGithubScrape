// RUN: %dafny  /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method lol() returns (c: int)
{/* TODO */ }

