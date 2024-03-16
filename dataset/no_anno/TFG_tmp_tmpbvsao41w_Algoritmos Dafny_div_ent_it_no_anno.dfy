method div_ent_it(a: int, b: int) returns (c: int, r: int)

// Algoritmo iterativo de la división de enteros
// que calcula su cociente y resto

{
    c := 0; r := a ;
    while (r >= b)
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
