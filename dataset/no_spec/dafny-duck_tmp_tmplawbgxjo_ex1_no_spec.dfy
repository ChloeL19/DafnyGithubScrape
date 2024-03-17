// program verifies
method StringSwap(s: string, i: nat, j: nat) returns (t: string)
// string length can't be -ve
{
    t := s;

    if (|s| > 0){
        var x:char := s[i];
        var y:char := s[j];
        t := t[j := x][i := y];
    }
    
}

