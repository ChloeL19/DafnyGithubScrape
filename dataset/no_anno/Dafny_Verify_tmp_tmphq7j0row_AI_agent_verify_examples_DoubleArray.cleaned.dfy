method DoubleArray(src: array<int>, dst: array<int>)
{
    var n := 0;
    while n != src.Length
    invariant 0 <= n <= src.Length
    invariant forall i :: 0 <= i < n ==> dst[i] == 2 * old(src[i]) 
    invariant forall i :: n <= i < src.Length ==> src[i] == old(src[i])
    {
        dst[n] := 2 * src[n]; n := n + 1;
    } 
}
