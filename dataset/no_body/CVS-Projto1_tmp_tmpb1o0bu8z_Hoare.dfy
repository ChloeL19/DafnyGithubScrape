method Max (x: nat, y:nat) returns (r:nat)
    ensures (r >= x && r >=y)
    ensures (r == x || r == y)
{/* TODO */ }

method Test ()
{/* TODO */ }

method m1 (x: int, y: int) returns (z: int)
requires 0 < x < y
ensures z >= 0 && z <= y && z != x
{/* TODO */ }



function fib (n: nat) : nat
{
    if n == 0 then 1 else
    if n == 1 then 1 else
    fib(n -1) + fib (n-2)
}

method Fib (n: nat) returns (r:nat)
    ensures r == fib(n)
{/* TODO */ }


datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function add(l:List<int>) : int
{
    match l
    case Nil => 0
    case Cons(x, xs) => x + add(xs)
}


method addImp (l: List<int>) returns (s: int)
    ensures s == add(l)
{/* TODO */ }


method MaxA (a: array<int>) returns (m: int)
    requires a.Length > 0
    ensures forall i :: 0 <= i < a.Length ==> a[i] <= m
    ensures exists i :: 0 <= i < a.Length && a[i] == m
{/* TODO */ }

