method suma_it(V: array<int>) returns (x: int)
{
    var n := V.Length ;
        x := 0 ;
    while (n != 0)
        invariant 0 <= n <= V.Length && x == suma_vector(V, n)
        decreases n
    {
        x := x + V[n - 1] ;
        n := n - 1 ;
    }
}


function suma_vector(V: array<int>, n: nat): int
{    
    if (n == V.Length) then 0 
    else V[n] + suma_vector(V, n + 1)  
}

method Main()
{
    var v := new int[] [-1, 2, 5, -5, 8] ;
    var w := new int[] [ 1, 0, 5,  5, 8] ;
    var s1 := suma_it(v) ;
    var s2 := suma_it(w) ;

    print "La suma del vector v es: ", s1, "\n" ;
    print "La suma del vector w es: ", s2 ;
}
