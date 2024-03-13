function calcSum(n: nat) : nat 
{   
    n * (n - 1) / 2
}

method sum(n: nat) returns(s: nat)
{
    s := 0;
    var i := 0;
    while i < n 
        decreases n - i
        invariant 0 <= i <= n
        invariant s == calcSum(i + 1)
    {
        i := i + 1;
        s := s + i;
    }
}