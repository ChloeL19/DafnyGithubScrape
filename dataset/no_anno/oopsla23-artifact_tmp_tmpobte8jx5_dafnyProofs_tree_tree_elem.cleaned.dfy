datatype Tree = Empty | Branch(int, Tree, Tree)

function Size(t:Tree): int
{
  match t
  case Empty => 0
  case Branch(_, t1, t2) => 1 + Size(t1) + Size(t2)
}

function isEmpty(t:Tree): bool
{
    match t
    case Empty => true
    case Branch(_, _, _) => false
}

function Exists_eq(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x == v || Exists_eq(t1, v) || Exists_eq(t2, v)
}

function Forall_neq(t:Tree, v:int): bool
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x != v && Forall_neq(t1, v) && Forall_neq(t2, v)
}

function Elem(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x == v || Elem(t1, v) || Elem(t2, v)
}

