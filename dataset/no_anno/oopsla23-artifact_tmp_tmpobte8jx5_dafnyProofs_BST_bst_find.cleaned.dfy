datatype Tree = Empty | Branch(val: int, left: Tree, right: Tree)

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

function Valid(t:Tree): (b: bool)
{
    match t
    case Empty => true
    case Branch(v, t1, t2) => Forall_lt(t1, v) && Forall_gt(t2, v) && Valid(t1) && Valid(t2)
}

function Exists_eq(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x == v || Exists_eq(t1, v) || Exists_eq(t2, v)
}

function Exists_neq(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x != v || Exists_neq(t1, v) || Exists_neq(t2, v)
}

function Exists_lt(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x < v || Exists_lt(t1, v) || Exists_lt(t2, v)
}

function Exists_le(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x <= v || Exists_le(t1, v) || Exists_le(t2, v)
}

function Exists_gt(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x > v || Exists_gt(t1, v) || Exists_gt(t2, v)
}

function Exists_ge(t:Tree, v:int): bool
{
    match t
    case Empty => false
    case Branch(x, t1, t2) => x >= v || Exists_ge(t1, v) || Exists_ge(t2, v)
}

function Forall_eq(t:Tree, v:int): bool
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x == v && Forall_eq(t1, v) && Forall_eq(t2, v)
}

function Forall_neq(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x != v && Forall_neq(t1, v) && Forall_neq(t2, v)
}

function Forall_lt(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x < v && Forall_lt(t1, v) && Forall_lt(t2, v)
}

function Forall_le(t:Tree, v:int): bool
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x <= v && Forall_le(t1, v) && Forall_le(t2, v)
}

function Forall_gt(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x > v && Forall_gt(t1, v) && Forall_gt(t2, v)
}

function Forall_ge(t:Tree, v:int): bool
{
    match t
    case Empty => true
    case Branch(x, t1, t2) => x >= v && Forall_ge(t1, v) && Forall_ge(t2, v)
}

function Find(t:Tree, v:int): (b: bool)
{
    match t
    case Empty => false
    case Branch(x, t1, t2) =>
        if (x == v) then true 
        else if (v < x) then Find(t1, v) else Find(t2, v)
}

