method GCD2(a: int, b: int) returns (r: int)
requires a >= 0 && b >= 0
{
/*
    + APPLY ASSUMPTION a >= 0 as we applied rules that require a >= 0 +
    a >= 0
    &&
    b >= 0

    b == 0 && TRUE
    b > 0

    b == 0 && a == a
    &&
    b > 0

    + RULE i. (assume a >= 0 for rules to apply) +
    b == 0 && a == gcd(a,0)
    &&
    b > 0
    
    + JUSTIFICATION b > 0 means division by 0 averted in % +
    b == 0 && a == gcd(a,b)
    &&
    b > 0
        && TRUE
        && TRUE

    + IN DAFNY y != 0 ==> (x % y) >= 0 +   
    + RULE iv. (assume a >= 0 for rules to apply) +
    b == 0 && a == gcd(a,b)
    &&
    b > 0
        && a % b >= 0
        && gcd(a,b) == gcd(a,b)
    
    b == 0 && a == gcd(a,b)
    &&
    b > 0
        && a % b >= 0
        && gcd(b,a%b) == gcd(a,b)

    b == 0 && a == gcd(a,b)
    &&
    b > 0 && b >= 0
        && a % b >= 0
        && gcd(b,a%b) == gcd(a,b)

    + REMOVE b < 0 as +
    + cannot apply rules involving gcd(a,b) as it is holds for a:nat, b:nat +
    ( b < 0 || b > 0 ) || a == gcd(a,b) 
    &&
    b == 0 || ( b >= 0 && a % b >= 0 ) &&
              ( gcd(b,(a % b)) == gcd(a,b) )

    b != 0 || a == gcd(a,b) 
    &&
    b == 0 || ( b >= 0 && a % b >= 0 ) &&
              ( gcd(b,(a % b)) == gcd(a,b) )

    b == 0 ==> a == gcd(a,b) 
    &&
    b != 0 ==> 
        ( b >= 0 && a % b >= 0 ) &&
        ( gcd(b,(a % b)) == gcd(a,b) )
*/
    if (b == 0) {
        // a == gcd(a,b)
        r := a;
        // r == gcd(a,b)
    } else {
/*
        ( b >= 0 && a % b >= 0 ) &&
        ( gcd(b,(a % b)) == gcd(a,b) )

        + One Point Rule +
        ( b >= 0 && a % b >= 0 ) &&
            forall r' ::
                ( r' == gcd(b,(a % b)) )
        ==> ( r' == gcd(a,b) )

       ( a >= 0 && b >= 0 )[a,b\b,a%b] &&
            forall r' ::
                ( r == gcd(a,b) )[a,b,r\b,(a % b),r']
        ==> ( r == gcd(a,b) )[r\r']

        wp(r := M(E1,E2), Q)
            <===>
        P[a,b\E1,E2] &&
            forall r' ::
                R[a,b,r\E1,E2,r']
        ==> Q[r\r']

        + Method Rule +
 */
        r := GCD2(b, a % b);
        // r == gcd(a,b)
    }
    // r == gcd(a,b)
}
// r == gcd(a,b)
