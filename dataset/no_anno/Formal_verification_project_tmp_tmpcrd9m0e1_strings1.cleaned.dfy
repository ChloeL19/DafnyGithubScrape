method isPrefix(pre: string, str: string) returns (res: bool) 
{
    res := pre <= str;
}

method isSubstring(sub: string, str: string) returns (res: bool) {
method isSubstring(sub: string, str: string) returns (res: bool) {
    var i := 0;
    res := false;
    while i <= |str| - |sub| {
        var q := isPrefix(sub, str[i..]);
        res := res || q;
        i := i + 1;
    }
}

method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool) {
method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool) {
    found := false;
    var i := 0;
    while i <= |str1| - k {
        var q := isSubstring(str1[i..(i+k)], str2);
        found := found || q;
        i := i + 1;
    }
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat){
method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat){
    var i := 1;
    len := 0;
    while i <= |str1| && i <= |str2|{
        var res := haveCommonKSubstring(i, str1, str2);
        if res {
            len := i;
        }
        i := i + 1;
    }
}

method Main()
{
    var a := isPrefix("Hell", "Hello");
    var b := isSubstring("llo", "Hello");
    var k := haveCommonKSubstring(4, "Hello", "Hello");
    var d := maxCommonSubstringLength("Hello", "Hello");
    print "Result Prefix ", a, "\n";
    print "Result Substring ", b, "\n";
    print "Result K Substring ", k, "\n";
    print "Result Common Length ", d, "\n";
}


