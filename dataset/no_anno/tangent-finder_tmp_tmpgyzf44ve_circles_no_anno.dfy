method Tangent(r: array<int>, x: array<int>) returns (b: bool)
{
    var tempB, tangentMissing, k, l := false, false, 0, 0;
    while k != r.Length && !tempB
    {
        l:= 0;
        tangentMissing := false;
        while l != x.Length && !tangentMissing
        {

            if  r[k] == x[l] {
                tempB := true;
            }
            if (r[k] < x[l]) {
                tangentMissing := true;
            }
            l := l + 1;
        }
        k := k + 1;
    }
    b := tempB;
}
