method div_ent_it(a: int, b: int) returns (c: int, r: int)
{
    c := 0; r := a ;
    while (r >= b)
    invariant a == b * c + r && r >= 0 && b > 0
    decreases r   
    {
        c := c + 1 ;
        r := r - b ;
    }
}

method Main()
{
    var c, r := div_ent_it(6 , 2) ;
    print "Cociente: ", c, ", Resto: ", r ;
}
