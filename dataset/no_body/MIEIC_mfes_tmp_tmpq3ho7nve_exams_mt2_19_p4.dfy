function R(n: nat): nat {
    if n == 0 then 0 else if R(n-1) > n then R(n-1) - n else R(n-1) + n
}

method calcR(n: nat) returns (r: nat)
    ensures r == R(n) 
{/* TODO */ }
