function calcSum(n: nat) : nat 
{   
    n * (n - 1) / 2
}

method sum(n: nat) returns(s: nat)
    ensures s == calcSum(n + 1)
{/* TODO */ }
