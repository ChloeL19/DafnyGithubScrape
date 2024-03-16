function exp(x:int, e:int):int
    decreases e
{
if e == 0 then 1 else x*exp(x,e-1)
}

lemma   exp3_Lemma(n:int) 
    decreases n
{}

lemma  mult8_Lemma(n:int)
    decreases n
{
    if(n==1){

    }
    else{
        calc =={
            (exp(3,2*n) -1) % 8;
            (exp(3, 2*(n-1)) *8 + exp(3,2*(n-1)) - 1) % 8;
            {
                mult8_Lemma(n-1);
            }
            0;
        }
    }
}
