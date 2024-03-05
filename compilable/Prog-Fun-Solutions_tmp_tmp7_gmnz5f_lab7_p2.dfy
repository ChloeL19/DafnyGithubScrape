/* file : p2.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


method exercise2(a:int, n:int) returns (x:int)
ensures x >= n && (x == 2*a - n || x == 3*n - 2*a + 1)
{
    x := 3*n - 2*a + 1;
    assert (x > n || x <= n) && x == 3*n - 2*a + 1;
    if (x <= n) {
        assert x <= n && x == 3*n - 2*a + 1;
        assert 3*n-2*a+1 <= n && x == 3*n - 2*a + 1;
        assert 2*a >= 2*n+1 && x == 3*n - 2*a + 1;
        assert a > n && x == 3*n - 2*a + 1;
        x := 2*a-n;
        assert a > n && x == 2*a - n;
        assert 2*a > 2*n && x+n == 2*a;
        assert x+n > 2*n && x+n == 2*a;

        assert x > n && x == 2*a - n;
    }
    assert x > n && (x == 2*a - n || x== 3*n - 2*a + 1);



}
