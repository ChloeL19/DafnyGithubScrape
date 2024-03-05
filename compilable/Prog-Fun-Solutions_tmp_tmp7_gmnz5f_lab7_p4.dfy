/* file : p4.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


method preserveSum(x: int, y:int, a:int) returns (p: int, q: int)
ensures p + q == x + y
{
    p := x + a;
    q := y - a;
}

method preserveSumProduct(x: int, y:int) returns (p: int, q: int)
ensures p + q == x + y && p*q < 0
{

    p := x-y*y-1;
    assert p == x-y*y-1;
    q := y+y*y+1;
    assert p == x-y*y-1 && q == y+y*y+1 && p+q == x + y;

    if (x > y) {
        assert x > y && p == x-y*y-1 && q == y+y*y+1;
        p := x+x*x+1;
        q := y-x*x-1;
        assert x > y && p == x+x*x+1 && q == y-x*x-1;
        assert x > y && p-x-1 == x*x && q == y-x*x-1;

        // calculus x <= x*x
        assert x > y && x <= p-x-1 && q == y-x*x-1;
        assert x > y && 1 <= p && q == y-x*x-1;
        assert x > y && p > 0 && q == y-x*x-1;

        assert x*x > y && p > 0 && q == y-x*x-1;
        assert x*x > y && p > 0 && x*x == y-q-1;
        assert p > 0 && y-q-1 > y;
        assert p > 0 && -q-1 > 0;
        assert p > 0 && q < -1;
        assert p > 0 && q < 0;
        assert p*q < 0;
    }
}
