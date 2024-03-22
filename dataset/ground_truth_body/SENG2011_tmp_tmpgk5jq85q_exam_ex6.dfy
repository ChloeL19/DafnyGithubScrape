datatype Tree = Leaf(n:int) | Fork(n:int, l:Tree, r:Tree) | Bend(n:int, b:Tree)

function total(t: Tree): int
{
    match t {
        case Leaf(n) => n
        case Fork(n, l ,r) => n + total(l) + total(r)
        case Bend(n, b) => n + total(b)
    }

}

function bag(t: Tree): set<int>
{
    match t {
        case Leaf(n) => {n}
        case Fork(n, l ,r) => {n} + {total(l)} + {total(r)}
        case Bend(n, b) => {n} + {total(b)}
    }
}

predicate growing(t: Tree)
{
    match t {
        case Leaf(n) => true
        case Fork(n, l ,r) => forall x:int :: x in bag(l) ==> n > x && forall x :: x in bag(r) ==> n > x
        case Bend(n, b) => forall x :: x in bag(b) ==> n > x
    }
}
