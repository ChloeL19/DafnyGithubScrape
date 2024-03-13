method firste(a: array<char>) returns (c:int)
{
    var i:int := 0;
    while i < a.Length
    invariant 0 <= i <= a.Length
    invariant forall x :: 0 <= x < i ==> a[x] != 'e'
    {
        if a[i] == 'e' {
            return i;
        }
        i := i + 1;
    }
    return -1;
}

method Main(){
method Main(){
    var a := new char[6]['c','h','e','e','s','e'];

    var p := firste(a);
    print p;
    //assert p == 2;

}
