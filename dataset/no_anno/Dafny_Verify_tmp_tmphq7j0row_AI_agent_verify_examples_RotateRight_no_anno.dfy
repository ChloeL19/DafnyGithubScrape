method RotateRight(a: array)
{
    var n := 1;
    while n != a.Length
    {
        a[0], a[n] := a[n], a[0]; n := n + 1;
    } 
}
