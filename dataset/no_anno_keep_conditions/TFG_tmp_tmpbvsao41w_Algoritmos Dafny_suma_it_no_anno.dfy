method suma_it(V: array<int>) returns (x: int)

// Algoritmo iterativo que calcula la
// suma de las componentes de un vector

    ensures  x == suma_vector(V, 0)
{
    var n := V.Length ;
        x := 0 ;
    while (n != 0)
    {
        x := x + V[n - 1] ;
        n := n - 1 ;
    }
}


function suma_vector(V: array<int>, n: nat): int

// x = V[n] + V[n + 1] + ... + V[N - 1]
// Funcion auxiliar para la suma de
// las componentes de un vector

    requires 0 <= n <= V.Length  
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
