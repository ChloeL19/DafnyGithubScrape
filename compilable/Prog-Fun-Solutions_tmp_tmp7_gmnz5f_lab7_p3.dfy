/* file : p3.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


method exercise3(y: int, a: int, n:int) returns (x: int)
requires y >= n && (y == 2*a - n || y == 3*n - 2*a + 1)
ensures x == a
{
    
    assert y == 2*a - n || y == 3*n - 2*a + 1;
    x := y;
    assert x == 2*a - n || x == 3*n - 2*a + 1;
    x := x + n;
    assert x == 2*a - n+n || x == 3*n - 2*a + 1+n;
    // {calculus}
    assert x == 2*a || x == 2*(2*n - a) + 1;

    if (x%2 == 1) {
        assert x%2 == 1 && (x == 2*a || x == 4*n - 2*a + 1);
        // rhs of or is false 
        assert x == 4*n - 2*a + 1;
        x := x - 4*n - 1;
        assert x == -2*a;
        x := -x;
        assert x == 2*a;

    }
    assert x == 2*a || x == 2*a;
    // {idempodence of or}
    assert x == 2*a;
    x := x/2;
    assert x == a;


}
