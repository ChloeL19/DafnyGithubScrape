
method multipleReturns (x:int, y:int) returns (more:int, less:int)
requires y > 0
ensures less < x < more


method multipleReturns2 (x:int, y:int) returns (more:int, less:int)
requires y > 0
ensures more + less == 2*x

// TODO: Hacer en casa
method multipleReturns3 (x:int, y:int) returns (more:int, less:int)
requires y > 0
ensures more - less == 2*y

function factorial(n:int):int
requires n>=0
{/* TODO */ }

// PROGRAMA VERIFICADOR DE WHILE
method ComputeFact (n:int) returns (f:int)
requires n >=0
ensures f== factorial(n)

{/* TODO */ }

method ComputeFact2 (n:int) returns (f:int)
requires n >=0
ensures f== factorial(n)
{/* TODO */ }


// n>=1 ==> 1 + 3 + 5 + ... + (2*n-1) = n*n

method Sqare(a:int) returns (x:int)
requires a>=1
ensures x == a*a
{/* TODO */ }


function sumSerie(n:int):int
requires n >=1 
{
    if n==1 then 1 else sumSerie(n-1) + 2*n -1
}

lemma {:induction false} Sqare_Lemma (n:int)
requires n>=1
ensures sumSerie(n) == n*n
{/* TODO */ }


method Sqare2(a:int) returns (x:int)
requires a>=1
ensures x == a*a

{/* TODO */ }


