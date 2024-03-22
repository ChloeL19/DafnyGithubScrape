
//Specify a method that computes the quotient q and the remain r
//of integer division between a and b
method divide(a:int,b:int)returns (q:int,r:int)
requires b > 0 && 0 <= a < b
ensures q * b + r == a

//Specify a method that returns a copy of the argument x
 method copy(x:int) returns (y:int)
 ensures x==y

 //Specify a method that returns the maximum of three integers
 method max3(x:int, y:int,z:int) returns (m:int)
 ensures m >= x && m >= y && m >= z

//Specify a method that returns a position of the maximum of the array
 method posMax1(v:array<int>) returns (i:int)
 ensures exists j::0<=j<v.Length && (forall x::0<=x<v.Length && x!=j ==> v[j]>=v[x])
 
 //Specify a method that returns a position of the maximum of the array
 //in segment [c,f)
 method posMax(v:array<int>, c:int, f:int) returns (i:int)
 requires v.Length > f > c >= 0
 ensures exists j::c<=j<f && forall k::c<=k<f && k!=j ==> v[k]<=v[j]

//Specify a method that swaps the values in v in indexes i and j
 method swap(v:array<int>,i:int,j:int) 
 requires v.Length > i >=0 && v.Length > j >= 0
 modifies v
 ensures v[i] == old(v[j]) && v[j] == old(v[i])
 
 
//Specify a method that modifies v such that all the negative values are assign value 0
// and the positive values are unchanged
 method positivize(v:array<int>,n:int)
 modifies v;
 ensures forall ix:nat :: ix < v.Length ==> 
    ((old(v[ix]<0) ==> v[ix] ==0 ) && 
    (old(v[ix]))>=0 ==> v[ix] == old(v[ix]))

 
