// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate R(x: int)
{
  forall x | R(x)
  {
  }
}
