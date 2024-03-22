datatype Nat = Zero | Succ(Pred: Nat)

/*

Nat: Zero, Succ(Zero), Succ(Succ(Zero)), ...

*/

lemma Disc(n: Nat)
ensures n.Succ? || n.Zero?
{/* TODO */ }

lemma LPred(n: Nat)
ensures Succ(n).Pred == n
{/* TODO */ }

// Succ(m') > m'

function add(m: Nat, n: Nat) : Nat
decreases m
{
    match m
    case Zero => n
    case Succ(m') => Succ(add(m', n))
}

// add(m, Zero) = m

lemma AddZero(m: Nat)
ensures add(m, Zero) == m
{/* TODO */ }

lemma AddAssoc(m: Nat, n: Nat, p: Nat)
ensures add(m, add(n, p)) == add(add(m, n), p)
{/* TODO */ }

lemma AddComm(m: Nat, n: Nat)
ensures add(m, n) == add(n, m)
{/* TODO */ }

predicate lt(m: Nat, n: Nat)
{
    (m.Zero? && n.Succ?) ||
    (m.Succ? && n.Succ? && lt(m.Pred, n.Pred))
}

lemma Test1(n:Nat)
ensures lt(n, Succ(Succ(n)))
{/* TODO */ }

lemma Test2(n: Nat)
ensures n < Succ(n)
{/* TODO */ }

/*
lemma L1()
ensures exists x: Nat :: x == Zero.Pred 
{/* TODO */ }
*/
/*
lemma L2(m: Nat, n: Nat)
ensures lt(m, n) == lt(n, m)
{/* TODO */ }
*/
lemma LtTrans(m: Nat, n: Nat, p: Nat)
requires lt(m, n)
requires lt(n, p)
ensures lt(m, p)
{/* TODO */ }

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

lemma Disc2<T>(l: List<T>, a: T)
ensures Cons(a, l).head == a && Cons(a, l).tail == l
{/* TODO */ }

function size<T>(l: List<T>): nat
{
    match l
    case Nil => 0
    case Cons(x, l') => size<T>(l') + 1
}

function app<T>(l1: List<T>, l2: List<T>) : List<T>
{
    match l1
    case Nil => l2
    case Cons(x, l1') => Cons(x, app(l1', l2))
}

lemma LenApp<T>(l1: List<T>, l2: List<T>)
ensures size(app(l1, l2)) == size(l1) + size(l2)
{/* TODO */ }

/*
 (1,(2,3)) -> ((3,2),1)
 (x, l') -> (rev(l'), x)
*/

function rev<T> (l: List<T>) : List<T>
{
    match l
    case Nil => Nil
    case Cons(x, l') => app(rev(l'), Cons(x, Nil))
}

lemma AppNil<T>(l: List<T>)
ensures app(l, Nil) == l
{/* TODO */ }

/*
lemma RevApp<T>(l1: List<T>, l2: List<T>)
ensures rev(app(l1, l2)) == app(rev(l2), rev(l1))
{/* TODO */ }
*/
lemma LR1<T> (l: List<T>, x: T)
ensures rev(app(l, Cons(x, Nil))) == Cons(x, rev(l))
{/* TODO */ }

lemma RevRev<T>(l: List<T>)
ensures rev(rev(l)) == l
{/* TODO */ }


/*
HW1: Define over naturals (as an algebraic data type)  the predicates odd(x) and even(x) 
and prove that the addition of two odd numbers is an even number.
Deadline: Tuesday 12.10, 14:00
*/

