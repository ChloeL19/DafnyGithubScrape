method AbsIt(s: array<int>) modifies s;
//requires 
{
    var i:int := 0;
    while i < s.Length
    {
        if (s[i] < 0) {
            s[i] := -s[i];
        }
        i := i + 1;
    }
}


