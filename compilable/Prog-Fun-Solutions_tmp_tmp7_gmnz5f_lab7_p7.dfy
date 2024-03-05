/* file : p7.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */


function sumDigits(n: nat) : nat {
    if n < 10 then n else n%10 + sumDigits(n/10)
}

lemma {:induction false} div3Lemma(n: nat)
ensures sumDigits(n)%3 == n%3
{
    if (n < 10) {
        // assert n%3 == n%3;
    } else {
        div3Lemma(n/10);
    }
}
