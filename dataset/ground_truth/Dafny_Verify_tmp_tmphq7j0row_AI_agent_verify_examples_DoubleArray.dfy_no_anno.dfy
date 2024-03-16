method DoubleArray(src: array<int>, dst: array<int>)
{
    var n := 0;
    while n != src.Length
    {
        dst[n] := 2 * src[n]; n := n + 1;
    } 
}
