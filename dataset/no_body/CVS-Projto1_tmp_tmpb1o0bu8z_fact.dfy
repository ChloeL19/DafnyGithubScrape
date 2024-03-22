function fact (n:nat): nat
 decreases n
{if n == 0 then 1 else n * fact(n-1)}

function factAcc (n:nat, a:int): int
 decreases n
{if (n==0) then a else factAcc(n-1,n*a)}

function factAlt(n:nat):int
{factAcc(n,1)}

lemma factAcc_correct (n:nat, a:int)
 ensures factAcc(n, a) == a*fact(n)
{/* TODO */ }

lemma factAlt_correct (n:nat)
 ensures factAlt(n) == fact(n)
{/* TODO */ }

datatype List<T> = Nil | Cons(T, List<T>)

function length<T> (l: List<T>) : nat
decreases l
{
    match l
    case Nil => 0
    case Cons(_, r) => 1 + length(r)
}

lemma {:induction false} length_non_neg<T> (l:List<T>)
    ensures length(l) >= 0
{/* TODO */ }

function lengthTL<T> (l: List<T>, acc: nat) : nat
{
    match l
    case Nil => acc
    case Cons(_, r) => lengthTL(r, 1 + acc)
}
lemma {:induction false}lengthTL_aux<T> (l: List<T>, acc: nat)
    ensures lengthTL(l, acc) == acc + length(l)
{/* TODO */ }
lemma lengthEq<T> (l: List<T>)
    ensures length(l) == lengthTL(l,0)
{/* TODO */ }

