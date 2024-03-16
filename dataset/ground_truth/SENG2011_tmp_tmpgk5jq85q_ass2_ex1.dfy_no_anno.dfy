// method verifies
method StringSwap(s: string, i:nat, j:nat) returns (t: string)
{
    t := s;
    if |s| == 0 {
        return t;
    }
    t := t[i := s[j]];
    t := t[j := s[i]];
}

method check() {
    var a:string := "1scow2";
    var b:string := StringSwap(a, 1, 5);
    var c:string := "";
    var d:string := StringSwap(c, 1, 2);
}
// string == seq<Char>
//give se2011 ass2 ex1.dfy

