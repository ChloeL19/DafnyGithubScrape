method suma_componentes(V : array?<int>) returns (suma : int)

{
    
  var n : int ;

  	n := V.Length ;  // n := N
  	suma := 0 ;

  {

    	suma := suma + V[n - 1] ;

    	n := n - 1 ;

  }

}



function suma_aux(V : array?<int>, n : int) : int

  // suma_aux(V, n) = V[n] + V[n + 1] + ... + V[N - 1]

{
    
  if (n == V.Length) then 0 					// Caso base:      n = N
                     else V[n] + suma_aux(V, n + 1)		// Caso recursivo: n < N
  
}
