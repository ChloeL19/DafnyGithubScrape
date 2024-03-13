/*                                      Cumulative Sums over Arrays                                        */

/*
    Daniel Cavalheiro   57869
    Pedro Nunes         57854
*/



//(a)

function sum(a: array<int>, i: int, j: int): int
{
    if (i == j) then 0
    else a[i] + sum(a, i+1, j)
}



//(b)

method query(a: array<int>, i: int, j: int) returns (res:int)
{
    res := 0;
    var k := i;

    while(k < j)
        invariant i <= k <= j <= a.Length
        invariant res + sum(a, k, j)  == sum(a, i, j)
    {
        res := res + a[k];
        k := k + 1;
    }
    
}



//(c)

predicate is_prefix_sum_for (a: array<int>, c: array<int>)
{
    forall i: int :: 0 <= i < a.Length ==> c[i+1] == c[i] + a[i]
}

lemma aux(a: array<int>, c: array<int>, i: int, j: int)
{}


method queryFast(a: array<int>, c: array<int>, i: int, j: int) returns (r: int)
{   
    aux(a, c, i, j);
    r := c[j] - c[i];    
}




method Main()
{
    var x := new int[10];
    x[0], x[1], x[2], x[3] := 2, 2, 1, 5;
    var y := sum(x, 0, x.Length);
    //assert y == 10;
    var c := new int[11];
    c[0], c[1], c[2], c[3], c[4] := 0, 2, 4, 5, 10;
   // var r := queryFast(x, c, 0, x.Length);
    
}
