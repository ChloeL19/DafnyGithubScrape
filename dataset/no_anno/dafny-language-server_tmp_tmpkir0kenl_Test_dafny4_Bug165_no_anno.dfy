// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

type T
function f(a: T) : bool

method Select(s1: seq<T>) returns (r: seq<T>)
{
   var r1, r2: seq<T>;

   r1 := Select(s1);
   r2 := Select(s1);

}