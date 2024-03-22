method ordenacion_seleccion(V: array<int>)

// Algoritmo iterativo que ordena
// las componentes de un vector

    modifies V
{
    var n := 0 ;
    while (n != V.Length)
        invariant 0 <= n <= V.Length
        invariant forall i, j :: 0 <= i < n <= j < V.Length ==> V[i] <= V[j]
    {
        var a := n ;
        var k := n + 1 ;
        while (k != V.Length)
            invariant n + 1 <= k <= V.Length
            invariant n <= a < k <= V.Length
            invariant forall j :: n <= j < k ==> V[a] <= V[j]
        {
            if (V[k] < V[a]) { a := k ; }
            k := k + 1 ;
        }
        V[n], V[a] := V[a], V[n] ;
        n := n + 1 ;
    }
}

method Main()
{
    var v := new int[] [-1, 2, 8, -5, 0] ;
    ordenacion_seleccion(v) ;

    var i: int := 0 ;
    print "El vector ordenado es: " ;
    print "[ " ;
    while i < v.Length{
        print v[i], " " ;
        i := i + 1 ; }
    print "]" ;
}
