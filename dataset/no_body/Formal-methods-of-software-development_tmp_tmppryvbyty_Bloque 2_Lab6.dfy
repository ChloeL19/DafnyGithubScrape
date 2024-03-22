/*predicate palindrome<T(==)> (s:seq<T>)
{
    forall i:: 0<=i<|s| ==> s[i] == s[|s|-i-1]
}
*/
// SUM OF A SEQUENCE OF INTEGERS
function sum(v: seq<int>): int 
decreases v
{
    if v==[] then 0
    else if |v|==1 then v[0]
    else v[0]+sum(v[1..])
}

/*
method vector_Sum(v:seq<int>) returns (x:int)
ensures x == sum(v) 
{/* TODO */ }

// Structural Induction on Sequences
lemma left_sum_Lemma(r:seq<int>, k:int)
requires 0 <= k < |r|
ensures sum(r[..k]) + r[k] == sum(r[..k+1]);
{/* TODO */ }

// MAXIMUM OF A SEQUENCE
method maxSeq(v: seq<int>) returns (max:int)
requires |v| >= 1
ensures forall i :: 0 <= i < |v| ==> max >= v[i]
ensures max in v
{/* TODO */ }

// TODO: Hacer
// Derivar formalmente un calculo incremental de j*j*j
method Cubes (n:int) returns (s:seq<int>)
requires n >= 0
ensures |s| == n
ensures forall i:int :: 0 <= i < n ==> s[i] == i*i*i
{/* TODO */ }


// REVERSE OF A SEQUENCE
function reverse<T> (s:seq<T>):seq<T> 
{
    if s==[] then []
    else reverse(s[1..])+[s[0]]
}

function seq2set<T> (s:seq<T>): set<T>
{
    if s==[] then {}
    else {s[0]}+seq2set(s[1..])
}


lemma seq2setRev_Lemma<T> (s:seq<T>)
ensures seq2set(reverse(s)) == seq2set(s)
{/* TODO */ }


lemma concat_seq2set_Lemma<T>(s1:seq<T>,s2:seq<T>)
ensures seq2set(s1+s2) == seq2set(s1) + seq2set(s2)
{/* TODO */ }


// REVERSE IS ITS OWN INVERSE

lemma Rev_Lemma<T(==)>(s:seq<T>)
//ensures forall i :: 0 <= i < |s| ==> s[i] == reverse(s)[|s|-1-i]

lemma ItsOwnInverse_Lemma<T> (s:seq<T>)
ensures s == reverse(reverse(s))
{/* TODO */ }

// SCALAR PRODUCT OF TWO VECTORS OF INTEGER
function scalar_product (v1:seq<int>, v2:seq<int>):int
requires |v1| == |v2|
{
    if v1 == [] then 0 else v1[0]*v2[0] + scalar_product(v1[1..],v2[1..])
}


lemma scalar_product_Lemma (v1:seq<int>, v2:seq<int>)
requires |v1| == |v2| > 0
ensures scalar_product(v1,v2) == scalar_product(v1[..|v1|-1],v2[..|v2|-1]) + v1[|v1|-1] * v2[|v2|-1]
{/* TODO */ }

// MULTISETS

method multiplicity_examples<T> ()
{/* TODO */ }

// REVERSE HAS THE SAME MULTISET 

lemma seqMultiset_Lemma<T> (s:seq<T>)
ensures multiset(reverse(s)) == multiset(s)
{/* TODO */ }
*/
lemma empty_Lemma<T> (r:seq<T>)
requires  multiset(r) == multiset{/* TODO */ } 
ensures r == []
{
	if r != []	{
		assert r[0] in multiset(r);
	}
}

lemma elem_Lemma<T> (s:seq<T>,r:seq<T>)
requires s != [] && multiset(s) == multiset(r)
ensures exists i :: 0 <= i < |r| && r[i] == s[0] && multiset(s[1..]) == multiset(r[..i]+r[i+1..]);

// SEQUENCES WITH EQUAL MULTISETS HAVE EQUAL SUMS

lemma sumElems_Lemma(s:seq<int>, r:seq<int>)   
requires multiset(s) == multiset(r)
ensures sum(s) == sum(r)
{/* TODO */ }
