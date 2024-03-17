datatype List = Nil | Cons(int, List)

function Len(l:List): (v: int)
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

function Stutter(l:List): (lout: List)
{
  match l
  case Nil => Nil
  case Cons(hd, tl) => Cons(hd, Cons(hd, Stutter(tl)))
}

