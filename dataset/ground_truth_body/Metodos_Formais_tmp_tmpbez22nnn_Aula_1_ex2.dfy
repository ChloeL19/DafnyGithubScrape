method Triplo(x:int) returns (r:int)
requires true
ensures r == 3*x
{
    // A aplicação não se importa necessariamente com a descrição do código
    // o de fato importante é a definição do método, quando utilizado fora.
    var y := Dobro(x);
    return y + x;
}

method Dobro(x:int) returns (r:int)
ensures r == 2 * x
