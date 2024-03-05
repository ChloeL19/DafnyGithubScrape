/* file : p1.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */

method exercise1(x:int, y:int, X:int, Y:int) returns (p:int, q: int)
requires X>Y && ((x==X && y==Y-2*x) || (x==Y && y==X-2*Y))
ensures p==X && q==Y
{

    assert (x==X && y==Y-2*x) || (x==Y && y==X-2*Y);
    p, q := x, y;
    assert (p==X && q==Y-2*p) || (p==Y && q==X-2*Y);
    // (calculus p=X)
    assert (p==X && q==Y-2*X) || (p==Y && q==X-2*Y);
    q := q+2*p;
    assert (p==X && q==Y - 2*X + 2*X) || (p==Y && q==X - 2*Y + 2*Y);
    // (calculus)
    assert (p==X && q==Y) || (p==Y && q==X);
    if (p < q) {
        assert p==Y && q==X;
        p, q := q, p;
        assert p==X && q==Y;
    }
    assert p==X && q==Y;

}
