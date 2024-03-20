predicate sorted_seg(a:array<int>, i:int, j:int) //j not included
{
    forall l, k :: i <= l <= k < j ==> a[l] <= a[k]
}


method selSort (a:array<int>, c:int, f:int)//f excluded
modifies a 
 {if (c<=f-1){//two elements at least
  var i:=c;
  while (i<f-1) //outer loop
  {
   var less:=i;
   var j:=i+1;
   while (j<f) //inner loop
    { if (a[j]<a[less]) {less:=j;}
      j:=j+1;
    }
   a[i],a[less]:=a[less],a[i];
   i:=i+1;
  }
 }
 }
