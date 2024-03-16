function maxcheck(s: array<nat>, i: int, max: int): int
{
    if i == 0 then max
    else if s[i - 1] > max then maxcheck(s, i - 1, s[i - 1])
    else maxcheck(s, i - 1, max)
}

method max(s: array<nat>) returns (a:int)
{
    a := s[0];
    var i:int := 0;
    while i < s.Length
    {
        if (s[i] > a) {
            a := s[i];
        }
        i := i + 1;
    }
}

method Checker() { 
    var a := new nat[][1,2,3,50,5,51]; 
    // ghost var  a := [1,2,3]; 
    var n := max(a); 
    // assert a[..] == [1,2,3]; 
    // assert MAXIMUM(1,2) == 2; 
    // assert ret_max(a,a.Length-1) == 12; 
    // assert ret_max(a,a.Length-1) == x+3; 
    }
