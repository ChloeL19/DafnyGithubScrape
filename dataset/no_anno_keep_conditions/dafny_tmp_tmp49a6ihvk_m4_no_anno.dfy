datatype Color = Red | White | Blue

predicate Below(c: Color, d: Color)
{
    c == Red || c == d || d == Blue
}



method DutchFlag(a: array<Color>)
    modifies a
    ensures forall i, j :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
    ensures multiset(a[..]) == multiset(old(a[..]))
{
    var r,w,b := 0, 0, a.Length;
    while w < b
    {
        match a[w]
        case Red => 
            a[r], a[w] := a[w], a[r];
            r, w := r + 1, w + 1;
        case White => 
            w := w + 1;
        case Blue => 
            a[b-1], a[w] := a[w], a[b-1];
            b := b - 1;
    }
}
