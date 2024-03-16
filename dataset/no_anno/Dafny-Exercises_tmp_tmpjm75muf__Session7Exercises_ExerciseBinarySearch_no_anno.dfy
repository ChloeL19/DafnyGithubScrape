predicate sorted(s : seq<int>) {
	forall u, w :: 0 <= u < w < |s| ==> s[u] <= s[w]
}

method binarySearch(v:array<int>, elem:int) returns (p:int)
 {
  var c,f:=0,v.Length-1;
  while (c<=f)
  {
   var m:=(c+f)/2;
   if (v[m]<=elem) 
        {c:=m+1;}
   else {f:=m-1;}
   }
   p:=c-1;
 
 
 }


 method search(v:array<int>,elem:int) returns (b:bool)
 {
    var p:=binarySearch(v, elem);
    if(p==-1){
      b:= false;
    }
    else{
       b:=v[p] == elem;
    }
 }




//Recursive binary search

method {:tailrecursion  false} binarySearchRec(v:array<int>, elem:int, c:int, f:int) returns (p:int)
 {
  if (c==f+1) 
     {p:=c-1;} //empty case: c-1 contains the last element less or equal than elem
  else 
  {
   var m:=(c+f)/2;
   
   if (v[m]<=elem) 
      {p:=binarySearchRec(v,elem,m+1,f);}
   else 
      {p:=binarySearchRec(v,elem,c,m-1);}
   
  }
 
 
 }
 
 


method otherbSearch(v:array<int>, elem:int) returns (b:bool,p:int)
 {
    p:=binarySearch(v, elem);
    
    if(p==-1){
      b:= false;
      p:=p+1;
    }
    else{
       b:=v[p] == elem;
       p:=p + if b then 0 else 1;
    }
 }
 

 
