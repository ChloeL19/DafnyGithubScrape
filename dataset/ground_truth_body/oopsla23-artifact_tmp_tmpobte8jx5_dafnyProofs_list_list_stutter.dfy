datatype List = Nil | Cons(int, List)

function Len(l:List): (v: int)
  ensures v >= 0
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
  ensures Len(lout) == Len(l) + 1 || Len(l) > 1 || l == lout
  ensures isEmpty(l) || Len(lout) > Len(l)
  ensures l == lout || Len(l) == 1 || Len(lout) > Len(l) + 1
{
  match l
  case Nil => Nil
  case Cons(hd, tl) => Cons(hd, Cons(hd, Stutter(tl)))
}

