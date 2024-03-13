method suma_componentes(V : array?<int>) returns (suma : int)
{
    
  var n : int ;

  assert V != null ;						      // P

  assert 0 <= V.Length <= V.Length && 0 == suma_aux(V, V.Length) ; // P ==> pmd(n := V.Length ; x := 0, I) 

  	n := V.Length ;  // n := N
  	suma := 0 ;

  assert 0 <= n <= V.Length && suma == suma_aux(V, n) ;		      // I
  
  while n != 0
  
    invariant 0 <= n <= V.Length && suma == suma_aux(V, n)	// I
    decreases n							// C
    
  {

    assert 0 <= n <= V.Length && suma == suma_aux(V, n) && n != 0 ; 	// I /\ B ==> R

    assert 0 <= n - 1 <= V.Length ;
    assert suma + V[n - 1] == suma_aux(V, n - 1) ; 			// R : pmd(x := x + V[n - 1], R1)

    	suma := suma + V[n - 1] ;

    assert 0 <= n - 1 <= V.Length && suma == suma_aux(V, n - 1) ; 	// R1 : pmd(n := n - 1, I)

    	n := n - 1 ;

    assert 0 <= n <= V.Length && suma == suma_aux(V, n) ; 		// I

  }

  assert 0 <= n <= V.Length && suma == suma_aux(V, n) && n == 0 ;  	// I /\ ¬B ==> Q 	

  assert suma == suma_aux(V, 0)	;					// Q 
  
}



function suma_aux(V : array?<int>, n : int) : int
{
    
  if (n == V.Length) then 0 					// Caso base:      n = N
                     else V[n] + suma_aux(V, n + 1)		// Caso recursivo: n < N
  
}
