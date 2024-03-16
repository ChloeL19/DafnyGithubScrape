method firste(a: array<char>) returns (c:int)
{
    var i:int := 0;
    while i < a.Length
    {
        if a[i] == 'e' {
            return i;
        }
        i := i + 1;
    }
    return -1;
}

method Main(){
    var a := new char[6]['c','h','e','e','s','e'];

    var p := firste(a);
    print p;
    //assert p == 2;

}
