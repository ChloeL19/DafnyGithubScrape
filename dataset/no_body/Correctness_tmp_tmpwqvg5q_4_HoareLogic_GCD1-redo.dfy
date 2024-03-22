method GCD1(a: int, b: int) returns (r: int)
requires a > 0 && b > 0
decreases b
//ensures r == gcd(a,b)
{/* TODO */ }
// r == gcd(a,b)

/*
    RULE
    v. ( (a % b) == 0 && b > 0 ) ==> b == gcd(a,b)
    v. ( (a % b) != 0 || b <= 0 ) || b == gcd(a,b)
*/

/* // END PROOF RULE v. HERE

    ( (a % b) == 0 && b > 0 ) ==> b == gcd(a,b) 
+ FINALLY ADD THE ASSUMES

    b == b
+ APPLY RULE i.

    b == gcd(b, 0)
    b == gcd(b, a % b)
    F || b == gcd(b, a % b)
+ ASSERT a % b == 0

    a % b != 0 || b == gcd(b, a % b)
    a % b == 0 ==> b == gcd(b,a % b) 
+ APPLY RULE iv.

    a % b == 0 ==> b == gcd(a,b) 
+ ASSUME b > 0

    ( (a % b) == 0 ) ==> b == gcd(a,b)
+ DERIVING RULE v. (for a >= 0 && b >= 0)

*/ // START PROOF v. HERE
