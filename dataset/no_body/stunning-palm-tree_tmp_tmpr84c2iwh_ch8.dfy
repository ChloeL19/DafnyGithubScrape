// Ch. 8: Sorting

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function Length<T>(xs: List<T>): int
  ensures Length(xs) >= 0
{
    match xs
    case Nil => 0
    case Cons(_, tl) => 1 + Length(tl)
}

function At<T>(xs: List, i: nat): T
  requires i < Length(xs)
{
    if i == 0 then xs.head else At(xs.tail, i - 1)
}

ghost predicate Ordered(xs: List<int>) {
    match xs
    case Nil => true
    case Cons(_, Nil) => true
    case Cons(hd0, Cons(hd1, _)) => (hd0 <= hd1) && Ordered(xs.tail)
}

lemma AllOrdered(xs: List<int>, i: nat, j: nat)
  requires Ordered(xs) && i <= j < Length(xs)
  ensures At(xs, i) <= At(xs, j)
{/* TODO */ }

// Ex. 8.0 generalize fron int to T by: T(==)
ghost function Count<T(==)>(xs: List<T>, p: T): int
  ensures Count(xs, p) >= 0
{
    match xs
    case Nil => 0
    case Cons(hd, tl) => (if hd == p then 1 else 0) + Count(tl, p)
}

ghost function Project<T(==)>(xs: List<T>, p: T): List<T> {
    match xs
    case Nil => Nil
    case Cons(hd, tl) => if hd == p then Cons(hd, Project(tl, p)) else Project(tl, p)
}

// Ex 8.1
lemma {:induction false} CountProject<T(==)>(xs: List<T>, ys: List<T>, p: T)
  requires Project(xs, p) == Project(ys, p)
  ensures Count(xs, p) == Count(ys, p)
{/* TODO */ }

function InsertionSort(xs: List<int>): List<int>
{
    match xs
    case Nil => Nil
    case Cons(x, rest) => Insert(x, InsertionSort(rest))
}

function Insert(x: int, xs: List<int>): List<int>
{
    match xs
    case Nil => Cons(x, Nil)
    case Cons(hd, tl) => if x < hd then Cons(x, xs) else Cons(hd, Insert(x, tl))
}

lemma InsertionSortOrdered(xs: List<int>)
  ensures Ordered(InsertionSort(xs))
{/* TODO */ }

lemma InsertOrdered(y: int, xs: List<int>)
  requires Ordered(xs)
  ensures Ordered(Insert(y, xs))
{/* TODO */ }

lemma InsertionSortSameElements(xs: List<int>, p: int)
  ensures Project(xs, p) == Project(InsertionSort(xs), p)
{/* TODO */ }

lemma InsertSameElements(y: int, xs: List<int>, p: int)
  ensures Project(Cons(y, xs), p) == Project(Insert(y, xs), p)
{/* TODO */ }
