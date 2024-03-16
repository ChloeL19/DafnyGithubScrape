method rev(a : array<int>)
{
    var i := 0;
    while (i < a.Length - 1 - i)
    {
        a[i], a[a.Length - 1 - i] := a[a.Length - 1 - i], a[i];
        i := i + 1;
    }
}
