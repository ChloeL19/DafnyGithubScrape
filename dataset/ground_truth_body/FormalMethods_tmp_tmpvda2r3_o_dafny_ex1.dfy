method Triplo(x:int) returns (r:int) // Assinatura
requires true // PRÉ: Pode ser omitido nesse caso.
ensures r == 3*x // PÓS 
//Code:
{
    // r:= 3*x;

    // return 3*x;

    var y := 2*x;
    return y + x;
}
