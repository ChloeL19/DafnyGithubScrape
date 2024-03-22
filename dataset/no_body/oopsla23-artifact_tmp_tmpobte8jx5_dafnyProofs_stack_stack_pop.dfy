datatype List = Nil | Cons(int, List)

datatype Stack = SList(list: List)

function ListLen(l:List): int
{
  match l
  case Nil => 0
  case Cons(hd, tl) => ListLen(tl) + 1
}

function isEmptyList(l:List): bool
{
  match l
  case Nil => true
  case Cons(hd, tl) => false
}

function StackLen(st:Stack): int
{
  match st
  case SList(l) => ListLen(l)
}

function isEmptyStack(st:Stack): bool
{
  match st
  case SList(l) => isEmptyList(l)
}

method Pop(st:Stack) returns (stout: Stack, v:int)
  requires !isEmptyStack(st)
  ensures StackLen(st) == StackLen(stout) + 1
{/* TODO */ }


