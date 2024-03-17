method arrayUpToN(n: int) returns (a: array<int>)
{
    var i := 0;
    a := new int[n];
    while i < n
    {
        a[i] := i;
        i := i + 1;
    }
}
