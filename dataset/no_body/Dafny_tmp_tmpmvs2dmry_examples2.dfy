method add_by_inc(x: nat, y:nat) returns (z:nat)
ensures z == x+y;
{/* TODO */ }

method Product(m: nat, n:nat) returns (res:nat)
ensures res == m*n;
{/* TODO */ }

method gcdCalc(m: nat, n: nat) returns (res: nat)
requires m>0 && n>0;
ensures res == gcd(m,n);
{/* TODO */ }

function gcd(m: nat, n: nat) : nat
requires m>0 && n>0;
decreases m+n
{
    if(m==n) then n 
    else if( m > n) then gcd(m-n,n)
    else gcd(m, n-m)
}

method exp_by_sqr(x0: real, n0: nat) returns (r:real)
requires x0 >= 0.0;
ensures r == exp(x0, n0);
{/* TODO */ }

function exp(x: real, n: nat) :real
decreases n;
{
    if(n == 0) then 1.0
    else if (x==0.0) then 0.0
    else if (n  ==0 && x == 0.0) then 1.0
    else x*exp(x, n-1)
}

// method add_by_inc_vc(x: int, y:int) returns (z:int)
// {/* TODO */ }


