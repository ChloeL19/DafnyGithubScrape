method GCD1(a: int, b: int) returns (r: int)
requires a >= 0 && b >= 0
requires a != 0 && b != 0
decreases b
//ensures r == gcd(a,b)
{/* TODO */ }
// r == gcd(a,b)

/*
    RULE
    v. ( (a % b) == 0 && b > 0 ) ==> b == gcd(a,b)
    v. ( (a % b) != 0 || b <= 0 ) || b == gcd(a,b)
*/

/*
+ DERIVING RULE v.
    ( (a % b) == 0 ) ==> b == gcd(a,b)
+ APPLY RULE iv.
    a % b == 0 ==> b == gcd(a,b) 
+ ASSUME b > 0
    a % b == 0 ==> b == gcd(b,a % b) 
    a % b != 0 || b == gcd(b, a % b)
+ ASSERT a % b == 0
    F || b == gcd(b, a % b)
    b == gcd(b, a % b)
    b == gcd(b, 0)
+ APPLY RULE i.
    b == gcd(b, 0)

+ FINALLY
    ( (a % b) == 0 && b > 0 ) ==> b == gcd(a,b) 
*/
