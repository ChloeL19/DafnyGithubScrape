method ordenar_mergesort(V : array?<int>)

    requires V != null
    
    modifies V

{/* TODO */ }



method mergesort(V : array?<int>, c : int, f : int) 

    requires V != null
    requires c >= 0 && f <= V.Length
    
    decreases f - c

    modifies V

{/* TODO */ }



method mezclar(V: array?<int>, c : int, m : int, f : int)

    requires V != null
    requires c <= m <= f
    requires 0 <= c <= V.Length
    requires 0 <= m <= V.Length
    requires 0 <= f <= V.Length

    modifies V

{/* TODO */ }
