method GCD1(a: int, b: int) returns (r: int)
requires a >= 0 && b >= 0
requires a != 0 && b != 0
{
/*
    (a >= b) || (
        ( gcd(b,a) == gcd(a,b) )
    )
    &&
    ( (a < b) || (a % b) != 0 ) || (
        ( b == gcd(a,b) )
    )
    &&
    ( (a < b) || (a % b) == 0 ) || (
        ( gcd(b,(a % b)) == gcd(a,b) )
    )
*/
/*
    (a >= b) || (
        ( gcd(b,a) == gcd(a,b) )
    )
    &&
    ( (a < b) || (a % b) != 0 ) || (
        b == gcd(a,b)
    )
    &&
    ( (a < b) || (a % b) == 0 ) || (
        ( gcd(b,(a % b)) == gcd(a,b) )
    )
*/
/*
    (a < b) ==> (
        ( gcd(b,a) == gcd(a,b) )
    )
    &&
    ( (a >= b) && (a % b) == 0 ) ==> (
        b == gcd(a,b)
    )
    &&
    (a >= b) && ( (a % b) != 0 ) ==> (
        ( gcd(b,(a % b)) == gcd(a,b) )
    )
*/
/*
    (a < b) ==> (
        ( b >= 0 && a >= 0 ) &&
        ( gcd(b,a) == gcd(a,b) )
    )
    &&
    ( !(a < b) && ( (a % b) == 0 ) ) ==> (
        b == gcd(a,b)
    )
    &&
    !(a < b) && !( (a % b) == 0 ) ==> (
        ( b >= 0 && a % b >= 0 ) &&
        ( gcd(b,(a % b)) == gcd(a,b) )
    )
*/
    if (a < b) 
    {
/*
        ( b >= 0 && a >= 0 ) &&
        ( gcd(b,a) == gcd(a,b) )

        + One Point Rule +
        ( b >= 0 && a >= 0 ) &&
            forall r' ::
                ( r' == gcd(b,a) )
        ==> ( r' == gcd(a,b) )

       ( a >= 0 && b >= 0 )[a,b\b,a] &&
            forall r' ::
                ( r == gcd(a,b) )[a,b,r\b,a,r']
        ==> ( r == gcd(a,b) )[r\r']

        wp(r := M(E1,E2), Q)
            <===>
        P[a,b\E1,E2] &&
            forall r' ::
                R[a,b,r\E1,E2,r']
        ==> Q[r\r']

        + Method Rule +
 */
        r := GCD1(b, a);
        // r == gcd(a,b)
    } 
    else if (a % b == 0) 
    {
//      b == gcd(a,b)
        r := b; // same as gcd(b,a%b) == gcd(b,0) == b
//      r == gcd(a,b)
    } 
    else 
    {
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
        r := GCD1(b, a % b);
//      r == gcd(a,b)
    }
}
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
