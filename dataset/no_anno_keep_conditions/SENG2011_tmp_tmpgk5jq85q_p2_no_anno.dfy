method AbsIt(s: array<int>) modifies s;
//requires 
ensures forall x :: 0 <= x < s.Length ==> old(s[x]) < 0 ==> s[x] == -old(s[x])
ensures forall x :: 0 <= x < s.Length ==> old(s[x]) >= 0 ==> s[x] == old(s[x])

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


