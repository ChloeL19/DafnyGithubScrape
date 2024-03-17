method Max (x: nat, y:nat) returns (r:nat)
{
    if (x >= y) { r := x;}
    else { r := y;}
}

method Test ()
{
    var result := Max(42, 73);
}

method m1 (x: int, y: int) returns (z: int)
{
    //assume 0 < x < y
    z := 0;
}



function fib (n: nat) : nat
{
    if n == 0 then 1 else
    if n == 1 then 1 else
    fib(n -1) + fib (n-2)
}

method Fib (n: nat) returns (r:nat)
{

    if (n == 0) {
        return 1;
    }
    r := 1;
    var next:=2;
    var i := 1;
    while i < n
    {
        var tmp:=next;
        next:= next + r;
        r:= tmp;
        i:= i + 1;
    }
    return r;
}


datatype List<T> = Nil | Cons(head: T, tail: List<T>)

function add(l:List<int>) : int
{
    match l
    case Nil => 0
    case Cons(x, xs) => x + add(xs)
}


method addImp (l: List<int>) returns (s: int)
{
    var ll := l;
    s := 0;
    while ll != Nil
        {
            s := s + ll.head;
            ll:= ll.tail;
        }
}


method MaxA (a: array<int>) returns (m: int)
{
    m := a[0];
    var i := 1;
    while i< a.Length
    {
        if a[i] > m {
            m:= a[i];
        }
        i := i +1;
    }
}

