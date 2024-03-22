function exp(x:int, e:int):int
    decreases e
	requires e >= 0
    ensures x > 0 ==> exp(x,e) > 0
{
if e == 0 then 1 else x*exp(x,e-1)
}

lemma   exp3_Lemma(n:int) 
    decreases n
    requires n >= 1
	ensures (exp(3,n)-1)%2 == 0
{/* TODO */ }

lemma  mult8_Lemma(n:int)
    decreases n
	requires n >= 1
	ensures (exp(3,2*n) - 1)%8 == 0
{/* TODO */ }

