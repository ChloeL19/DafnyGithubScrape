
 predicate isPeek(v:array<int>,i:int)
 {forall k::0<=k<i ==> v[i]>=v[k]}

 function peekSum(v:array<int>,i:int):int
 {
  if (i==0) then 0
  else if isPeek(v,i-1) then v[i-1]+peekSum(v,i-1)
  else peekSum(v,i-1)
 }

 
 method mPeekSum(v:array<int>) returns (sum:int)
 {
  var i:=1;
  sum:=v[0];
  var lmax:=v[0];
  while(i<v.Length)
  decreases v.Length -i
  invariant 0<i<=v.Length
  invariant lmax in v[..i]
  invariant forall k::0<=k<i ==> lmax>=v[k];
  invariant sum==peekSum(v, i)
  {
    if(v[i]>=lmax){
      sum:=sum + v[i];
      lmax:=v[i];
    }
    i:=i+1;
  }
 }
