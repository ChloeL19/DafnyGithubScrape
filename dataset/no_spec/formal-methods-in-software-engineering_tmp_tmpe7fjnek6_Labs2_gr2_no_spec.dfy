datatype Nat = Zero | Succ(Pred: Nat)

/*

Nat: Zero, Succ(Zero), Succ(Succ(Zero)), ...

*/

lemma Disc(n: Nat)
{
    //
}

lemma LPred(n: Nat)
{
    //
}

// Succ(m') > m'

function add(m: Nat, n: Nat) : Nat
{
    match m
    case Zero => n
    case Succ(m') => Succ(add(m', n))
}

// add(m, Zero) = m

lemma AddZero(m: Nat)
{
    //
}

lemma AddAssoc(m: Nat, n: Nat, p: Nat)
{
    //
}

lemma AddComm(m: Nat, n: Nat)
{
    match m
    case Zero => AddZero(n);
    case Succ(m') => AddComm(m', n);
}

predicate lt(m: Nat, n: Nat)
{
    (m.Zero? && n.Succ?) ||
    (m.Succ? && n.Succ? && lt(m.Pred, n.Pred))
}

lemma Test1(n:Nat)
{
    //
}

lemma Test2(n: Nat)
{
    //
}

/*
lemma L1()
{

    //
}
*/
/*
lemma L2(m: Nat, n: Nat)
{
    //
}
*/
lemma LtTrans(m: Nat, n: Nat, p: Nat)
{
    //assert n.Succ?;
    //assert p.Pred.Succ?;
    /*
    match m 
    case Zero => {
        match n
        case Zero => assert true;
        case Succ(n') => LtTrans(Zero, n', p);
    }
    case Succ(m') => LtTrans(m', n, p);
    */
}

datatype List<T> = Nil | Cons(head: T, tail: List<T>)

lemma Disc2<T>(l: List<T>, a: T)
{
    //
}

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
{
    //
}

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
{
    //
}

/*
lemma RevApp<T>(l1: List<T>, l2: List<T>)
{
    match l1
    case Nil =>    AppNil(rev(l2));
    case Cons(x, l1') => {
        // rev(Cons(x, app(l1', l2))) == app(rev(app(l1', l2)), Cons(x, Nil)))
        RevApp(l1', l2);
    }
}
*/
lemma LR1<T> (l: List<T>, x: T)
{
    //
}

lemma RevRev<T>(l: List<T>)
{
    match l
    case Nil => assert true;
    case Cons(x, l') => {
        LR1(rev(l'), x);
    }
    
}


/*
HW1: Define over naturals (as an algebraic data type)  the predicates odd(x) and even(x) 
and prove that the addition of two odd numbers is an even number.
Deadline: Tuesday 12.10, 14:00
*/

