method IncrementMatrix(a: array2<int>)
    modifies a
{
    var m := 0;
    while m != a.Length0
    {
        var n := 0;
        while n != a.Length1
        {
            a[m,n] := a[m,n] + 1;
            n := n + 1; 
        }
        m := m + 1; 
    }
}
