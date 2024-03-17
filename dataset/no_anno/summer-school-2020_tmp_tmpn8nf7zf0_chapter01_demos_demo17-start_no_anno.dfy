function Evens(x:int) : (s:seq<int>)
{
  if x==0 then [] else Evens(x-1) + [2 * (x-1)]
}

