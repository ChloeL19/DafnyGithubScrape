method Triplo(x:int) returns (r:int)
{
    // A aplicação não se importa necessariamente com a descrição do código
    // o de fato importante é a definição do método, quando utilizado fora.
    var y := Dobro(x);
    return y + x;
}

method Dobro(x:int) returns (r:int)
