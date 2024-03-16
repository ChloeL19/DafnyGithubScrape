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

function Append(l1:List, l2:List): (lout: List)
{
  match l1
  case Nil => l2
  case Cons(hd, tl) => Cons(hd, Append(tl, l2))
}

