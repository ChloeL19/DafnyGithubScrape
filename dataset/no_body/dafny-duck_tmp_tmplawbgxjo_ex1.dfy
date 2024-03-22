// program verifies
method StringSwap(s: string, i: nat, j: nat) returns (t: string)
// string length can't be -ve
requires |s| >= 0
// ensure i and j can take values higher than string
requires if(|s| > 0) then (j < |s|) else j >= 0
requires if(|s| > 0) then (i < |s|) else i >= 0
// ensure number of elements are same
ensures |s| == |t| 
// ensure all elements are same
ensures multiset(s) == multiset(t)
// ensure swap occurs if string has length
ensures if(|s| > 0) then (s[j] == t[i] && s[i] == t[j]) else s == t
// ensure all unswapped elements are in fact unswapped
ensures forall k:nat :: 0 <= k < |s| && (k != i && k != j) ==> s[k] == t[k]
{
    t := s;

    if (|s| > 0){
        var x:char := s[i];
        var y:char := s[j];
        t := t[j := x][i := y];
    }
    
}

