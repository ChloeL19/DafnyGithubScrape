
predicate positive(s:seq<int>)
{forall u::0<=u<|s| ==> s[u]>=0}

predicate isEven(i:int)
{i%2==0}

function CountEven(s:seq<int>):int
{if s==[] then 0
 else (if (s[|s|-1]%2==0) then 1 else 0)+CountEven(s[..|s|-1])
 }

lemma ArrayFacts<T>()
  {}

method mcountEven(v:array<int>) returns (n:int)
{   ArrayFacts<int>(); 

 n:=0;
 var i:int;
 i:=0;
 while (i<v.Length)
   decreases v.Length - i//write
   invariant 0<=i<=v.Length//write
   invariant n==CountEven(v[..i])
 {

   if (v[i]%2==0) {n:=n+1;}
   i:=i+1;

 }
 }



