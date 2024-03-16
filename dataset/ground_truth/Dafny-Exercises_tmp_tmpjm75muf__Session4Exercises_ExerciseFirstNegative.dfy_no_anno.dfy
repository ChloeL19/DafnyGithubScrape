predicate positive(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}


method mfirstNegative(v:array<int>) returns (b:bool, i:int)
{ 
 i:=0;
 b:=false;
 while (i<v.Length && !b)
  { 
    b:=(v[i]<0);
    i:=i+1;
   }
  if (b){i:=i-1;}
}

method mfirstNegative2(v:array<int>) returns (b:bool, i:int)
{ 
 i:=0;b:=false;
 while (i<v.Length && !b)
  { 
    b:=(v[i]<0);
    if (!b) {i:=i+1;}
   }
}
