/* file : p5.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


function f(n: nat): int
{
    if n <= 1 then 1-n else 2*f(n-1) + f(n-2) + n
}


method computeF(n: nat) returns (a: int)
ensures a == f(n)
{
    var x := 0;
    var y := 1;
    var k := 0;
    while k < n
    invariant x == f(k+1) && y == f(k)
    invariant 0 <= k <= n
    decreases n-k
    {
        assert f(k+2) == 2*f(k+1) + f(k) + k+2;
        assert x == f(k+1) && y == f(k);
        assert f(k+2) == 2*x + y + k+2;

        x, y := 2*x+y+k+2, x;
        assert x == f(k+2) && y == f(k+1);
        k := k + 1;
        assert x == f(k+1) && y == f(k);
    }

    assert k == n;
    assert x == f(n+1) && y == f(n);
    a := y;
}

