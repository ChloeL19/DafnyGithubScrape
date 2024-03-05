/* file : p8.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */

function sumCubes(n: nat) : nat {
    if n == 0 then 0 else n*n*n + sumCubes(n-1)
}

lemma {:induction false} sumLemma(n: nat)
ensures sumCubes(n) == n*n*(n+1)*(n+1)/4
{
    if (n == 0) {
    } else {
        sumLemma(n-1);
    }
}
