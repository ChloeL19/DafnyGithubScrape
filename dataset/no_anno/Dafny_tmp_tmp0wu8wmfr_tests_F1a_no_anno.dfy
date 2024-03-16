method F() returns ( r: int)
{
    r := 0;
}

method Main() 
{
    var x := F();
    x := x-1;
    print x;
}


method Mid( p: int, q: int) returns ( m: int )
    // | ... | ??? | ... |
    //        p m   q
{
    m := (p+q)/2;
}
