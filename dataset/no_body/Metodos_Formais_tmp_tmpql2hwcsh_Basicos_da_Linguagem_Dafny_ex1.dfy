// número naturais: nat, números reais: real, números inteiros: int
// x pertence aos inteiros -> retorna um r inteiro
method Triplo(x:int) returns (r:int)
// Pré-Condição, utiliza requires, se for true não precisa colocar nada se não quiser
requires true

// Pós-Condição, utiliza ensures, o valor r é igual a 3 vezes o valor de x
ensures r == 3*x

//Código, foi criado um teorema (:= significa atribuição) verificando se é verdade
{
    // verificação direto de atribuição ao r
    //r := 3*x; 
    
    // verificação utilizando direto o returns (que é o r) e calculando 3 vezes o x
    // returns 3*x;

    // pode ser criado uma variavel multiplicando duas vezes e soma mais uma vez o x
    // var y := 2*x;
    // return y + x;

    // Podemos criar uma função também e podemos chamar ele no nosso programa
    var y := Dobro(x);
    return y + x;
}

method Dobro(x:int) returns (r:int)
ensures r == 2*x
