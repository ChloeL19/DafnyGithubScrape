// successfully verifies
method GetEven(a: array<nat>)
{
    var i := 0;
    while i < a.Length
    {
        if a[i] % 2 != 0
        {
            a[i] := a[i] + 1;
        }
        i := i + 1;
    }
}
