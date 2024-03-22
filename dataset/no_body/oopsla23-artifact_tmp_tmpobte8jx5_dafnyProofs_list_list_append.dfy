datatype List = Nil | Cons(int, List)

function Len(l:List): int
  ensures Len(l) >= 0
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
  ensures Len(l1) + Len(l2) == Len(lout)
  ensures l2 == lout || l1 == lout || Len(lout) > 1
  // ensures Len(lout) >= Len(l2) + 1 || l2 == lout
  // ensures isEmpty(l2) ==> l1 == lout
  ensures l2 == lout || Len(lout) == Len(l2) + 1 || Len(l1) > 1
  ensures l1 == lout || Len(lout) > Len(l1) + 1 || Len(l2) == 1
{
  match l1
  case Nil => l2
  case Cons(hd, tl) => Cons(hd, Append(tl, l2))
}

