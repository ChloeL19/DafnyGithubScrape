/*
Dafny include 2 limbaje:
    * un limbaj pentru specificare 
        MSFOL (ce am discutat până acum)
        adnotări care să ajute în procesul de verificare
    * un limbaj pentru scris programe
*/

// Exemplu de program

method SqrSum(n: int) returns (s: int)
{/* TODO */ }

method DivMod(a: int, b: int) returns (q: int, r: int)
decreases *
{/* TODO */ }

/*
    triple Hoare (| P |) S (| Q |) 
*/

// varianta assume-assert
method HoareTripleAssmAssrt()
{/* TODO */ }

// varianta requires-ensures

method HoareTripleReqEns(i: int, k: int) returns (k': int)
	// (| k == i*i |) k := k + 2 * i +1; (| k = (i+1)*(i+1) |)
	requires  k == i*i
	ensures  k' == (i+1)*(i+1)
{/* TODO */ }

/*
regula pentru while
*/

// varianta cu assert
/*
method WhileRule()
{/* TODO */ }
*/

// varianta cu invariant
method Invariant1()
{/* TODO */ }

//specificarea sumei de patrate
function SqrSumRec(n: int) : int
	requires n >= 0
{
	if (n == 0) then 0 else n*n + SqrSumRec(n-1)
}
/*
method SqrSum1(n: int) returns (s: int)
	requires n >= 0
	ensures s == SqrSumRec(n)  // s = 0^2 + 1^2 + 2^2 + ... + n^2 == n(n+1)(2n+1)/6
{/* TODO */ }
*/

// verificarea programului pentru suma de patrate

method SqrSum1(n: int) returns (s: int)
	requires n >= 0
	ensures s == SqrSumRec(n)
{/* TODO */ }

// SqrSumRec(n) = 0^2 + 1^2 + 2^2 + ... + n^2 == n(n+1)(2n+1)/6
least lemma L1(n: int)
	requires n >= 0
    ensures SqrSumRec(n) == n*(n+1)*(2*n + 1)/6
{/* TODO */ }

/*
function SqrSumBy6(n: int) : int
{
	n * (n + 1) * (2 * n + 1) 
}

inductive lemma L(n: int) // it takes a while
	decreases n
	requires n >= 0
	ensures  SqrSumBy6(n) == 6 * SqrSumRec(n)
{/* TODO */ }

*/

method DivMod1(a: int, b: int) returns (q: int, r: int)
requires b > 0 && a >= 0
ensures a == b*q + r && 0 <= r < b
//decreases *
{/* TODO */ }

method Main()
	decreases *
{/* TODO */ }


