// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype List = Nil | Cons(int, List)

method R(xs: List)
{/* TODO */ }

function F(xs: List): int
{
  var a := 4;
  var b := 7;
  match xs
  case Nil => 0
  case Cons(a, Nil()) => 1
  case Cons(x, Cons(b, tail)) => 2
}


