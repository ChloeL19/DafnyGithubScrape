predicate sorted_seg(a:array<int>, i:int, j:int) //j not included
{
    forall l, k :: i <= l <= k < j ==> a[l] <= a[k]
}


method selSort (a:array<int>, c:int, f:int)//f excluded
 {if (c<=f-1){//two elements at least
  var i:=c;
  while (i<f-1) //outer loop
     decreases f-i
  {
   var less:=i;
   var j:=i+1;
   while (j<f) //inner loop
    decreases f-j//write
    { if (a[j]<a[less]) {less:=j;}
      j:=j+1;
    }
   a[i],a[less]:=a[less],a[i];
   i:=i+1;
  }
 }
 }
