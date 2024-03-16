method find_min_index(a : array<int>, s: int, e: int) returns (min_i: int)
{
    min_i := s;
    var i : int := s;  

    while i < e 
    {
        if a[i] <= a[min_i] {
            min_i := i;
        }
        i := i + 1;
    }

}



predicate is_sorted(ss: seq<int>)
{
    forall i, j: int:: 0 <= i <= j < |ss| ==> ss[i] <= ss[j]
}

predicate is_permutation(a:seq<int>, b:seq<int>)
{
    |a| == |b|  && 
    ((|a| == 0 && |b| == 0) ||  
    exists i,j : int :: 0<=i<|a| &&  0<=j<|b|  && a[i] == b[j] && is_permutation(a[0..i] + if i < |a| then a[i+1..] else [], b[0..j] + if j < |b| then  b[j+1..] else []))
}


// predicate is_permutation(a:seq<int>, b:seq<int>)
// decreases |a|
// decreases |b|
// {
//     |a| == |b|  && ((|a| == 0 && |b| == 0) ||  exists i,j : int :: 0<=i<|a| &&  0<=j<|b|  && a[i] == b[j] && is_permutation(a[0..i] + a[i+1..], b[0..j] + b[j+1..]))
// }

predicate is_permutation2(a:seq<int>, b:seq<int>)
{
    multiset(a) == multiset(b)
}



method selection_sort(ns: array<int>) 
{
    var i: int := 0;
    var l: int := ns.Length;
    while i < l
    {
        var min_i: int := find_min_index(ns, i, ns.Length);
        ns[i], ns[min_i] := ns[min_i], ns[i];
        i := i + 1;
    }

}
