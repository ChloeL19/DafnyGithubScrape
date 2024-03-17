predicate InsertionSorted(Array: array<int>, left: int, right: int)  
{           
  forall i,j :: left <= i < j < right ==> Array[i] <= Array[j]
}


method sorting(Array: array<int>)
{  
  var high := 1;     
  while (high < Array.Length) 
  {  
    var low := high-1;        
    while low >= 0 && Array[low+1] < Array[low]
    {
      Array[low], Array[low+1] := Array[low+1], Array[low];           
      low := low-1;       
    }            
    high := high+1;       
  }
}      

