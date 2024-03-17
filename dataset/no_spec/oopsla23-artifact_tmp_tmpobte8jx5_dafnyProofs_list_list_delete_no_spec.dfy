datatype List = Nil | Cons(int, List)

function Len(l:List): (v:int)
{
  match l
  case Nil => 0
  case Cons(hd, tl) => Len(tl) + 1
}

function isEmpty(l:List): bool
{
    match l
    case Nil => true
    case Cons(hd, tl) => false
}

function Exists_eq(l:List, x:int): bool
{
  match l
  case Nil => false
  case Cons(hd, tl) => hd == x || Exists_eq(tl, x)
}

function Exists_neq(l:List, x:int): bool
{
  match l
  case Nil => false
  case Cons(hd, tl) => hd != x || Exists_neq(tl, x)
}

function Exists_lt(l:List, x:int): bool
{
  match l
  case Nil => false
  case Cons(hd, tl) => hd < x || Exists_lt(tl, x)
}

function Exists_gt(l:List, x:int): bool
{
  match l
  case Nil => false
  case Cons(hd, tl) => hd > x || Exists_gt(tl, x)
}

function Forall_eq(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd == x || Forall_eq(tl, x)
}

function Forall_neq(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd != x || Forall_neq(tl, x)
}

function Forall_le(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd <= x || Forall_le(tl, x)
}

function Forall_ge(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd >= x || Forall_ge(tl, x)
}

function Forall_lt(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd < x || Forall_lt(tl, x)
}

function Forall_gt(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd > x || Forall_gt(tl, x)
}

function Delete(l:List, v:int): (lout: List)
{
  match l
  case Nil => Nil
  case Cons(hd, tl) =>
    if (hd == v) then Delete(tl, v) else Cons(hd, Delete(tl, v))
}

