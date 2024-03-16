//Exercicio 1.a)
function sum (a:array<int>, i:int, j:int) :int
decreases j
reads a
{
    if i == j then
        0
    else
        a[j-1] + sum(a, i, j-1)
}

//Exercicio 1.b)
method query (a:array<int>, i:int, j:int) returns (s:int)
{
    s := 0;
    var aux := i;

    while (aux < j)
    {
        s := s + a[aux];
        aux := aux + 1;
    }
    return s;
}

//Exercicio 1.c)
lemma queryLemma(a:array<int>, i:int, j:int, k:int)
{
}

method queryFast (a:array<int>, c:array<int>, i:int, j:int) returns (r:int)
{
    r := c[j] - c[i];
    queryLemma(a,0,j,i);

    return r;
}

predicate is_prefix_sum_for (a:array<int>, c:array<int>)
reads c, a
{
    a.Length + 1 == c.Length
    && c[0] == 0
    && forall j :: 1 <= j <= a.Length ==> c[j] == sum(a,0,j)
}

///Exercicio 2.
datatype List<T> = Nil | Cons(head: T, tail: List<T>)

method from_array<T>(a: array<T>) returns (l: List<T>)
{
    var i:= a.Length-1;
    l:= Nil;

    while (i >= 0)
    {
        l := Cons(a[i], l);
        i := i - 1;
    }

    return l;
}

function mem<T(==)> (x: T, l:List<T>) : bool
decreases l
{
    match l
    case Nil => false
    case Cons(y,r)=> if (x==y) then true else mem(x,r)
}

