

function Sum(v:array<int>,i:int,j:int):int
{
    if (i==j) then 0
    else Sum(v,i,j-1)+v[j-1]
}

predicate SumMaxToRight(v:array<int>,i:int,s:int)
{
forall l,ss {:induction l}::0<=l<=i && ss==i+1==> Sum(v,l,ss)<=s
}

method segMaxSum(v:array<int>,i:int) returns (s:int,k:int)
{
 s:=v[0];
 k:=0;
 var j:=0;
 while (j<i)
 decreases i-j
 invariant 0<=j<=i
 invariant 0<=k<=j && s==Sum(v,k,j+1)
 invariant SumMaxToRight(v,j,s)
 {  
    if (s+v[j+1]>v[j+1]) {s:=s+v[j+1];}
    else {k:=j+1;s:=v[j+1];}

     j:=j+1;
 }

} 


function Sum2(v:array<int>,i:int,j:int):int
{
    if (i==j) then 0
    else v[i]+Sum2(v,i+1,j)
}

//Now do the same but with a loop from right to left
predicate SumMaxToRight2(v:array<int>,j:int,i:int,s:int)//maximum sum stuck to the right
{(forall l,ss {:induction l}::j<=l<=i && ss==i+1 ==> Sum2(v,l,ss)<=s)}

method segSumaMaxima2(v:array<int>,i:int) returns (s:int,k:int)
{
 s:=v[i];
 k:=i;
 var j:=i;
 var maxs:=s;
 while(j>0)
 decreases j
 invariant 0<=j<=i
 invariant 0<=k<=i 
 invariant s==Sum2(v,j,i+1) 
 invariant SumMaxToRight2(v,j,i,maxs)
 invariant maxs==Sum2(v,k,i+1)
 {
    s:=s+v[j-1];
    if(s>maxs){
        maxs:=s;
        k:=j-1;
    }
    j:=j-1;
 }
 s:=maxs;
}
