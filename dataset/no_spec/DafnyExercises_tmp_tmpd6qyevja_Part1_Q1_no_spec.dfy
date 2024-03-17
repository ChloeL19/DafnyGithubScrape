method addArrays(a : array<int>, b : array<int>) returns (c : array<int>) 
{
     c := new int[a.Length];
     var j := 0;
     while (j < a.Length) 
     {    
          c[j] := a[j] + b[j];
          j := j + 1;      
    }
}
