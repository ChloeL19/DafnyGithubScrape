// program verifies
method StringSwap(s: string, i: nat, j: nat) returns (t: string)
{
    t := s;

    if (|s| > 0){
        var x:char := s[i];
        var y:char := s[j];
        t := t[j := x][i := y];
    }
    
}

