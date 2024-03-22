// RUN: %dafny  /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method F() returns(x:int)
  ensures x == 6;
{/* TODO */ }

method Main()
{/* TODO */ }
