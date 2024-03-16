method CopyMatrix(src: array2, dst: array2)
{
    var m := 0;
    while m != src.Length0
    {
        var n := 0;
        while n != src.Length1
        {
            dst[m,n] := src[m,n]; n := n + 1;
        }
        m := m + 1; 
    }
}
