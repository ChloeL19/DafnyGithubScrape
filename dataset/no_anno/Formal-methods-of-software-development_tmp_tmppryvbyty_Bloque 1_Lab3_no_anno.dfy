
method multipleReturns (x:int, y:int) returns (more:int, less:int)
{
    if n==0 || n==1 then 1 else n*factorial(n-1)
}

// PROGRAMA VERIFICADOR DE WHILE
method ComputeFact (n:int) returns (f:int)
{   
    f:=1;
    var x:=n;
    {
        f:= f*x;
        x:=x-1;
    }
}

method ComputeFact2 (n:int) returns (f:int)
{
    var x:= 0;
    f:= 1;
    while x<n
    {
        x:=x+1;
        f:= f*x;
    }
    
}


// n>=1 ==> 1 + 3 + 5 + ... + (2*n-1) = n*n

method Sqare(a:int) returns (x:int)
{
    var y:=1;
    x:=1;
    while y < a 
    {
        y:= y+1;
        x:= x+ (2*y-1);
    }
}


function sumSerie(n:int):int
{
    if n==1 then 1 else sumSerie(n-1) + 2*n -1
}

lemma {:induction false} Sqare_Lemma (n:int)
{
    if n==1 {}
    else{
        Sqare_Lemma(n-1);
        calc == {
            sumSerie(n);
            sumSerie(n-1) + 2*n -1;
            {
                Sqare_Lemma(n-1);
            }
            (n-1)*(n-1) + 2*n -1;
            n*n-2*n+1 +2*n -1;
            n*n;
        }
    }
}


method Sqare2(a:int) returns (x:int)
{
    var y:=1;
    x:=1;
    {
        y:= y+1;
        x:= x +2*y -1;
    }
}


