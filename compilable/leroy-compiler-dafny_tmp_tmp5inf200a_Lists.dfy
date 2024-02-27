/* Lists and options */
module Lists {

  datatype option<T> = Some(T) | None
  datatype list<T> = Nil | Cons(T, list<T>)

  // Append function (Leroy uses Coq lists)
  function append<T>(l1: list<T>, l2: list<T>): list<T>
  {
    match l1
    case Nil => l2
    case Cons(x, xs) => Cons(x, append(xs, l2))
  }

  function length<T>(l: list<T>): nat
  {
    match l
    case Nil => 0
    case Cons(_, xs) => 1 + length(xs)
  }
}
