function Evens(x:int) : (s:seq<int>)
  requires x>=0
  ensures |s| == x
  ensures forall i :: 0<=i<|s| ==> s[i] == 2 * i
{
  if x==0 then [] else Evens(x-1) + [2 * (x-1)]
}

