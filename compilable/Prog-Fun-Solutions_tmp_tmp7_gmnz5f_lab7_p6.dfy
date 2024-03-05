/* file : p6.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 21 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


method mystery(a: nat) returns (q:nat, r:nat)
ensures  a == q*3 + r
ensures 0 <= r < 3
{
    q, r := 0, a + 1;

    while r >= 4
    invariant 0 < r <= a+1
    invariant a == q*3 + r-1 
    decreases r
    {
        assert a == q*3 + r-1; // random bs, I choose you
        assert a == q*3 + (r-r%4) + r%4-1;
        assert a == q*3 + ((r-r%4)*4 + r%4*4)/4-1;
        assert a == q*3 + ((r-r%4)*3 + r - r%4 + r%4*4)/4-1;
        assert a == q*3 + (r/4*4*3 + r - r%4 + r%4*4)/4-1;

        assert a == q*3 + (r/4*3*4 + r/4*4 +r%4*4)/4-1;
        assert a == q*3 + r/4*3 + r/4+r%4-1;

        assert a == (q+r/4)*3 + r/4+r%4-1;
        q := q + r/4;

        assert a == q*3 + r/4+r%4-1;
        r := r/4 + r%4; // 2+3=5  1+0=1
        assert a == q*3 + r - 1;
    }

    assert a == q*3 + r - 1;
    r := r - 1;
    assert a == q*3 + r;
}
