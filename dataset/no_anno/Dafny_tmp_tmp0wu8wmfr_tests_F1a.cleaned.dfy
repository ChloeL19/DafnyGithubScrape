method F() returns ( r: int)
{
    r := 0;
}

method Main() 
{
    var x := F();
    assert x <= 0;
    x := x-1;
    assert x <= -1;
    print x;
}


method Mid( p: int, q: int) returns ( m: int )
{
    m := (p+q)/2;
    assert m == p+(q-p)/2;
}
