 predicate sorted (a:array<int>, start:int, end:int) // all "before" end are sorted      
 {           
   forall j,k:: start<=j<k<end ==> a[j]<=a[k]
 }


method InsertionSort (a:array<int>)
{  
    var up := 1;   
    
    while (up < a.Length)   // outer loop   
    invariant 1 <= up <= a.Length 
    invariant sorted(a,0,up)
    {  
        var down := up-1;      
        var temp := a[up];          
        while down >= 0 && a[down+1] < a[down]    // inner loop
            invariant forall j,k | 0 <= j < k < up+1 && k != down+1 :: a[j]<=a[k]
        {
            a[down],a[down+1] := a[down+1],a[down];           
            down := down-1;       
        }            
        up := up+1;
           
    }
}      
method Main(){
method Main(){
  var a := new int[5];
  a[0],a[1],a[2],a[3],a[4] := 3,2,5,1,8;
  InsertionSort(a);
  print a[..];
}

