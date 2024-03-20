
predicate sorted_seg(a:array<int>, i:int, j:int) //i and j included
{
    forall l, k :: i <= l <= k <= j ==> a[l] <= a[k]
}

method InsertionSort(a: array<int>)
  modifies a;
{

  var i := 0;
  {

     var temp := a[i];
     var j := i;         
     while (j > 0 && temp < a[j - 1])
     {   
        
         a[j] := a[j - 1]; 
         j := j - 1;
     }
  
  
  a[j] := temp;
  i := i + 1;

  }
}





