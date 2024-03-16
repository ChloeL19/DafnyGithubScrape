predicate sorted_seg(a:array<int>, i:int, j:int) //j excluded
{
    forall l, k :: i <= l <= k < j ==> a[l] <= a[k]
}

method bubbleSorta(a:array<int>, c:int, f:int)//f excluded
{
  var i:=c;
  while (i< f)
    decreases a.Length-i
   {
    var j:=f-1;

    {
        //assert a[j]

     //assert multiset(a[c..f]) == old(multiset(a[c..f])) ;
        if (a[j-1]>a[j]){
          a[j],a[j-1]:=a[j-1],a[j];
          
        }
        j:=j-1;
    }
    i:=i+1;
   }




}


method bubbleSort(a:array<int>, c:int, f:int)//f excluded
{
  var i:=c;
  var b:=true;

  while (i<f && b)
  decreases a.Length-i
   {
    var j:=f-1;
    
    b:=false;


    {
        if (a[j-1]>a[j]) {    
        a[j],a[j-1]:=a[j-1],a[j]; 
        
        b:=true;
        }
        j:=j-1;
    }
    i:=i+1;
   }




}
