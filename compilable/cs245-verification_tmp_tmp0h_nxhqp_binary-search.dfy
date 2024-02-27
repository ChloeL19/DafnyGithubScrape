//Binary Search -- Stephanie Renee McIntyre
//Based on the code used in the course overheads for Fall 2018
//Code was modified to have arrays start at 0, not 1.

method binary(a:array<int>, x:int) returns (m: int, found: bool) requires a.Length>=1 
  /*Pre-Condition*/ requires forall i,j :: 0 <= i <= j < a.Length ==> a[i] <= a[j] 
  /*Post-Condition*/ ensures forall k :: (found && (0 <= m < a.Length ==> a[m] == x)) 
                                      || (!found && (0 <= k < a.Length ==> (!(a[k] == x)))) {
    
    var l := 0;         //lower
    var u := a.Length;  //upper
    m := -1;
    found := false;
    
    while(l < u && !found)
      invariant l <= u <= a.Length 
      invariant (found && 0 <= m < a.Length) ==> a[m] == x
      invariant forall i :: 0 <= i < a.Length ==> ((a[i] == x) ==> l <= i < u) {
      
          m := ((l+u)/2);
          if(a[m] == x){
              found := true;
              return; //Fun facts: If this commented, then Dafny cannot prove termination!!! >.<
          }
          else if(a[m] < x){
              l := m+1;
          }
          else{
              u := m;
          }
     }
}

