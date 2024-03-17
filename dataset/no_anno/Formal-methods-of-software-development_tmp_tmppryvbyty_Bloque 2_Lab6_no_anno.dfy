/*predicate palindrome<T(==)> (s:seq<T>)
{
    forall i:: 0<=i<|s| ==> s[i] == s[|s|-i-1]
}
*/
// SUM OF A SEQUENCE OF INTEGERS
function sum(v: seq<int>): int 
{
    if v==[] then 0
    else if |v|==1 then v[0]
    else v[0]+sum(v[1..])
}

/*
method vector_Sum(v:seq<int>) returns (x:int)
{
    var n := 0 ;
    x := 0;
    while n != |v|
	{
        left_sum_Lemma(v, n+1);
        x, n := x + v[n], n + 1;
    }
}

// Structural Induction on Sequences
lemma left_sum_Lemma(r:seq<int>, k:int)
{
    if |r|==1 || k==0{
    }
    else {
        left_sum_Lemma(r[1..], k);
        calc {
            sum(r[..k+1]);
            sum(r[..k]) + [r[k]];
        }
    }
}

// MAXIMUM OF A SEQUENCE
method maxSeq(v: seq<int>) returns (max:int)
{
    max := v[0];
    var v' := v[1..];
    ghost var t := [v[0]];
    while |v'| >= 1
	{
        if v'[0] > max { max := v'[0]; }
        v', t := v'[1..], t + [v'[0]];
	}
}

// TODO: Hacer
// Derivar formalmente un calculo incremental de j*j*j
method Cubes (n:int) returns (s:seq<int>)
{
s := [];
var c, j, k, m := 0,0,1,6;
while j < n
	{
	s := s+[c]; 
	//c := (j+1)*(j+1)*(j+1);
	c := c + k;
	k := k + 6*j + 6;
	m := m + 6;
	//assert m == 6*(j+1) + 6 == 6*j + 6 + 6;
                == 3*j*j + 3*j + 1 + (6*j + 6);
	//assert c == (j+1)*(j+1)*(j+1) == j*j*j + 3*j*j + 3*j + 1;
	j := j+1;
	//assert m == 6*j + 6;
	//assert k == 3*j*j + 3*j + 1;
	//assert c == j*j*j;
	}
}


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
{
    if s==[]{}
    else {
        seq2setRev_Lemma(s[1..]);
        calc {
            seq2set(s);
            seq2set([s[0]]+s[1..]);
            {
                concat_seq2set_Lemma([s[0]], s[1..]);
            }
            seq2set([s[0]]) + seq2set(s[1..]);
            {
                seq2setRev_Lemma(s[1..]);
            }
            seq2set([s[0]]) + seq2set(reverse(s[1..]));
            seq2set(reverse(s[1..])) + seq2set([s[0]]); 
            {
                concat_seq2set_Lemma(reverse(s[1..]), [s[0]]);
            }
            seq2set(reverse(s[1..]) + [s[0]]);
            {
            }
            seq2set(reverse(s));
        }
    }
}


lemma concat_seq2set_Lemma<T>(s1:seq<T>,s2:seq<T>)
{
    if s1==[]{
    }
    else {
        concat_seq2set_Lemma(s1[1..], s2);
        calc{
            seq2set(s1) + seq2set(s2);
            seq2set([s1[0]]+s1[1..]) + seq2set(s2);
            seq2set([s1[0]]) + seq2set(s1[1..]) + seq2set(s2);
            {
                concat_seq2set_Lemma(s1[1..], s2);
            }
            seq2set([s1[0]]) + seq2set(s1[1..]+s2);
            {
            }
            seq2set([s1[0]]) + seq2set((s1+s2)[1..]);
            {
                // assert seq2set([s1[0]]) + seq2set((s1+s2)[1..]) == seq2set(s1+s2);
                var ls:= s1+s2;
                calc {
                    seq2set([s1[0]]) + seq2set((s1+s2)[1..]);
                    seq2set([ls[0]])+ seq2set(ls[1..]);
                    seq2set([ls[0]]+ ls[1..]);
                    seq2set(ls);
                    seq2set(s1+s2);
                }
            }
            seq2set(s1+s2);
        }
    }
}


// REVERSE IS ITS OWN INVERSE

lemma Rev_Lemma<T(==)>(s:seq<T>)
//ensures forall i :: 0 <= i < |s| ==> s[i] == reverse(s)[|s|-1-i]

lemma ItsOwnInverse_Lemma<T> (s:seq<T>)
{
    if s==[]{}
    else{
        ItsOwnInverse_Lemma(s[1..]);
        calc {
            reverse(reverse(s));
            reverse(reverse(s[1..])+[s[0]]);
            reverse(reverse([s[0]]+s[1..]));
            {
            }
            reverse(reverse(s[1..]) + [s[0]]);
            {
                // TODO: Demostrar este assume
                assume reverse(reverse(s[1..]) + [s[0]]) == [s[0]] + reverse(reverse(s[1..]));
            }
            [s[0]] + reverse(reverse(s[1..]));
            {
                ItsOwnInverse_Lemma(s[1..]);
            }
            [s[0]]+s[1..];
            s;
        }
    }
}

// SCALAR PRODUCT OF TWO VECTORS OF INTEGER
function scalar_product (v1:seq<int>, v2:seq<int>):int
{
    if v1 == [] then 0 else v1[0]*v2[0] + scalar_product(v1[1..],v2[1..])
}


lemma scalar_product_Lemma (v1:seq<int>, v2:seq<int>)
{
    // INDUCCION EN LA LONGITUD DE V1
    if |v1| == 0 && |v2| == 0 {}
    else if |v1| == 1 {}
    else {
        // Se crean estas variables para simplificar las operaciones
        var v1r:= v1[1..];
        var v2r:= v2[1..];
        var t1:= |v1[1..]|-1;
        var t2:= |v2[1..]|-1;

        // Se realiza la induccion utilizando las variables
        scalar_product_Lemma(v1r, v2r);
                scalar_product(v1r[..t1],v2r[..t2]) + v1r[t1] * v2r[t2]; //HI
        
        // Se demuestra que la propiedad se mantiene
        calc{
            scalar_product(v1,v2);
            v1[0]*v2[0] + scalar_product(v1r, v2r);
            v1[0]*v2[0] + scalar_product(v1r[..t1],v2r[..t2]) + v1r[t1] * v2r[t2];
            {
                scalar_product_Lemma(v1r, v2r);
                        scalar_product(v1r[..t1],v2r[..t2]) + v1r[t1] * v2r[t2]; //HI
            }
            v1[0]*v2[0] + scalar_product(v1r,v2r);
            v1[0]*v2[0] + scalar_product(v1[1..],v2[1..]);
            scalar_product(v1,v2);
        }
    }
}

// MULTISETS

method multiplicity_examples<T> ()
{
var m := multiset{2,4,6,2,1,3,1,7,1,5,4,7,8,1,6};
}

// REVERSE HAS THE SAME MULTISET 

lemma seqMultiset_Lemma<T> (s:seq<T>)
{
    if s==[]{}
    else {
        seqMultiset_Lemma(s[1..]);
        calc {
            multiset(reverse(s));
            multiset(reverse(s[1..]) + [s[0]]);
            multiset(reverse(s[1..])) + multiset{[s[0]]};
            multiset(s[1..]) + multiset{[s[0]]};
            multiset(s);
        }
    }
}
*/
lemma empty_Lemma<T> (r:seq<T>)
{
	if r != []	{
	}
}

lemma elem_Lemma<T> (s:seq<T>,r:seq<T>)
{
    if s==[]{
        empty_Lemma(r);
    }
    else {
        // Con este lema demuestro que el elemento que le quito a s tambien se lo quito a r y de esta manera
        // poder hacer la induccion
        elem_Lemma(s,r);
		var i :| 0 <= i < |r| && r[i] == s[0] && multiset(s[1..]) == multiset(r[..i]+r[i+1..]);
		sumElems_Lemma(s[1..], r[..i]+r[i+1..]);
        sumElems_Lemma(s[1..], r[..i]+r[i+1..]);
        calc {
            sum(s);
            s[0]+sum(s[1..]);
            {
                sumElems_Lemma(s[1..], r[..i]+r[i+1..]);
            }
            s[0]+sum(r[..i]+r[i+1..]);
            {
            }
            r[i]+sum(r[..i]+r[i+1..]);
            {
                // TODO: No consigo acertarlo
                assume r[i]+sum(r[..i]+r[i+1..]) == sum([r[i]]+r[..i] + r[i+1..]) == sum(r);
            }
            sum(r);
        }
    }
}
