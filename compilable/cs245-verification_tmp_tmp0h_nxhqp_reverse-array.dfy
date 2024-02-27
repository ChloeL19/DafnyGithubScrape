//Reversing an array -- Stephanie Renee McIntyre
//Based on the code used in the course overheads for Fall 2018
//Code was modified to have arrays start at 0, not 1.

method reverse(a: array<int>, R:array<int>) modifies R; requires a.Length==R.Length>0 && a!=R; 
  /*Pre-Condition*/ requires forall x:: 0<=x<a.Length ==> a[x]==R[x]; 
  /*Post-Condition*/ ensures forall x:: 0<=x<a.Length ==> R[x]==a[a.Length-x-1];{
    
  var j := 0;
  
  while(2*j<R.Length-1)
  //Our invariant... in parts!
    invariant 0<=j<=R.Length-1;                                          
    invariant forall x:: 0<=x<j ==> R[x] == a[a.Length-x-1];                  //modified array at beginning
    invariant forall x:: j<=x<a.Length-j ==> R[x]==a[x];                      //unmodified array at middle
    invariant forall x:: a.Length-j<=x<a.Length ==> R[x]==a[a.Length-x-1];    //modified array at end
    
  //Our variant
    decreases R.Length/2 - j + 1; {
    
    //This is a simple swap code as seen in class
    var t := R[j];
    R[j] := R[R.Length-j-1];
    R[R.Length-j-1] := t;
    j := j+1;
  }
}

