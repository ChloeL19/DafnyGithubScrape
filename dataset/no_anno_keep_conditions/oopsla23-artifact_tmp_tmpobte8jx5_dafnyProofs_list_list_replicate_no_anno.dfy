datatype List = Nil | Cons(int, List)

function Len(l:List): int
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

function Forall_eq(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd == x && Forall_eq(tl, x)
}

function Replicate(v:int, n:int): (lout: List)
  requires n >= 0
  ensures Forall_eq(lout, v)
  ensures Len(lout) == n
{
  if n > 0 then Cons(v, Replicate(v, n-1)) else Nil
}

