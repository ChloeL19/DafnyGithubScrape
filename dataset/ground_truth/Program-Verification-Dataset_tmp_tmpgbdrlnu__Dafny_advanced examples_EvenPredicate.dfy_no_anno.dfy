// RUN: /compile:0 /nologo

function IsEven(a : int) : bool
{
    if a == 0 then      true 
    else if a == 1 then false 
    else                IsEven(a - 2)
}

lemma EvenSquare(a : int)
{
    if a >= 2 && IsEven(a) {
        EvenSquare(a - 2);
        EvenDouble(2 * a - 2);
        EvenPlus((a - 2) * (a - 2), 4 * a - 4);
    }
}

lemma EvenDouble(a: int)
{
    if a >= 2 {
        EvenDouble(a - 2);
    }
}

lemma {:induction x} EvenPlus(x: int, y: int)
{
    if x >= 2 {
        EvenPlus(x - 2, y);
    }
}


/*
lemma {:induction x} EvenTimes(x: int, y: int)
{
    if x >= 2 {
        calc {
            IsEven(x * y);
            IsEven((x - 2) * y + 2 * y); { Check1(y); EvenPlus((x - 2) * y, 2 * y); }
            true;
        }
    }
}
*/

