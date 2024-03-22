// RUN: /compile:0 /nologo

function IsEven(a : int) : bool
    requires a >= 0
{
    if a == 0 then      true 
    else if a == 1 then false 
    else                IsEven(a - 2)
}

lemma EvenSquare(a : int)
requires a >= 0
ensures IsEven(a) ==> IsEven(a * a)
{/* TODO */ }

lemma EvenDouble(a: int)
    requires a >= 0
    ensures IsEven(a + a)
{/* TODO */ }

lemma {:induction x} EvenPlus(x: int, y: int)
    requires x >= 0
    requires y >= 0
    requires IsEven(x)
    requires IsEven(y)
    ensures IsEven(x + y)
{/* TODO */ }


/*
lemma {:induction x} EvenTimes(x: int, y: int)
    requires x >= 0
    requires y >= 0
    requires IsEven(x)
    requires IsEven(y)
    ensures IsEven(x * y)
{/* TODO */ }
*/

