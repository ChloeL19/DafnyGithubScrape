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

function ElemIndex(l:List, v:int): (idx: int)
{
  match l
  case Nil => -1
  case Cons(hd, tl) => 
    if (v == hd) then 0 else
      if (ElemIndex(tl, v) < 0) then -1 else ElemIndex(tl, v) + 1
}

