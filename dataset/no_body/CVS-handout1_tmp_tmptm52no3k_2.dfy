/*                                      Functional Lists and Imperative Arrays                                        */

/*
    Daniel Cavalheiro   57869
    Pedro Nunes        57854
*/

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function length<T>(l: List<T>): nat
{
  match l
  case Nil => 0
  case Cons(_, t) => 1 + length(t)
}

predicate mem<T(==)> (l: List<T>, x: T)
{
  match l
  case Nil => false
  case Cons(h, t) => if(h == x) then true else mem(t, x)
}

function at<T>(l: List<T>, i: nat): T
  requires i < length(l)
{
  if i == 0 then l.head else at(l.tail, i - 1)
}

method from_array<T>(a: array<T>) returns (l: List<T>)
  requires a.Length >= 0
  ensures length(l) == a.Length
  ensures forall i: int :: 0 <= i < length(l) ==> at(l, i) == a[i]
  ensures forall x :: mem(l, x) ==> exists i: int :: 0 <= i < length(l) && a[i] == x
{/* TODO */ }

method Main() {/* TODO */ }
