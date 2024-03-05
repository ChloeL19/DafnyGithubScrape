/* file : p9.dfy */
/* author : Gabriele Berardi (g.berardi@student.rug.nl) */
/* date : Wed Nov 15 2023 */
/* version: 1.0 */
/* Description: A program corretness exersise in dafny */

function exp(a:nat, e:nat): nat {
    if e == 0 then 1 else a*exp(a,e-1)
}

function fastExp(a:nat, e:nat): nat
decreases e
{
    if e == 0 then 1
    else if e%2 == 0 then fastExp(a*a, e/2)
    else a*fastExp(a, e-1)
}

lemma equalExp(a: nat, e: nat)
ensures exp(a,e) == fastExp(a,e)
decreases e
{
    if (e == 0) {
    } else {
        if (e%2 == 0) {
            calc {
                exp(a, e);
            ==
                a*exp(a, e-1);
            == 
                exp(a*a, e/2);
            }
            equalExp(a*a, e/2);
        } else {
            equalExp(a, e-1);
        }
    }
}
