method addArrays(a : array<int>, b : array<int>) returns (c : array<int>) 
{
     c := new int[a.Length];
     var j := 0;
     while (j < a.Length) 
       invariant 0 <= j <= c.Length
       invariant forall i :: (0 <= i < j) ==> c[i] == a[i] + b[i];
     {    
          c[j] := a[j] + b[j];
          j := j + 1;      
    }
}
