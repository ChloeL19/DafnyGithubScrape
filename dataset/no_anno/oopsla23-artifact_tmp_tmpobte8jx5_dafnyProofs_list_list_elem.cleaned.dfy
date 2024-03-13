datatype List = Nil | Cons(int, List)

function Len(l:List): int
{
  match l
  case Nil => 0
  case Cons(hd, tl) => Len(tl) + 1
}

function Exists_eq(l:List, x:int): bool
{
  match l
  case Nil => false
  case Cons(hd, tl) => hd == x || Exists_eq(tl, x)
}

function Forall_neq(l:List, x:int): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => hd != x || Forall_neq(tl, x)
}

function Elem(l:List, x:int): (b: bool)
{
  match l
  case Nil => false
  case Cons(hd, tl) => (x == hd) || Elem(tl, x)
}

