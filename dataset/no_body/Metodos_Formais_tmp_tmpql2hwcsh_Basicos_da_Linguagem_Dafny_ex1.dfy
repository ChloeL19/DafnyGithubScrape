// número naturais: nat, números reais: real, números inteiros: int
// x pertence aos inteiros -> retorna um r inteiro
method Triplo(x:int) returns (r:int)
// Pré-Condição, utiliza requires, se for true não precisa colocar nada se não quiser
requires true

// Pós-Condição, utiliza ensures, o valor r é igual a 3 vezes o valor de x
ensures r == 3*x

//Código, foi criado um teorema (:= significa atribuição) verificando se é verdade
{/* TODO */ }

method Dobro(x:int) returns (r:int)
ensures r == 2*x
