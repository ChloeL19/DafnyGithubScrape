method join(a:array<int>,b:array<int>) returns (c:array<int>)
{

    c := new int[a.Length+b.Length];
    var i:= 0;
    while(i < a.Length)
    {
        c[i] := a[i];
        i := i +1;
    }

    i:= a.Length;
    var j := 0;


    while(i < c.Length && j<b.Length) // missed j condition
    {
        
        c[i] := b[j];
        i := i +1;
        j := j +1;
    }

    //     assert j == b.Length;
    // assert b[..]==b[..b.Length];
    // assert j + a.Length == c.Length;
    // assert multiset(c[..a.Length]) == multiset(a[..a.Length]);
    // assert multiset(b[..]) == multiset(b[..j]);
    // assert multiset(c[a.Length..j+a.Length]) == multiset(c[a.Length..c.Length]);
    // assert multiset(c[a.Length..c.Length]) == multiset(c[a.Length..c.Length]);
    // assert multiset(c[a.Length..c.Length]) == multiset(b[..]);
    // assert multiset(c[0..c.Length]) == multiset(c[0..a.Length]) + multiset(c[a.Length..c.Length]);
    
    // uncomment 
}


method Check(){
    var a := new int[][1,2,3];
    var b := new int[][4,5];
    var c := new int[][1,2,3,4,5];
    var d:= join(a,b);
    // print n[..];

}
