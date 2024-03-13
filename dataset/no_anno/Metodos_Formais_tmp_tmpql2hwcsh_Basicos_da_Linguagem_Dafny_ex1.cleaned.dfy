// número naturais: nat, números reais: real, números inteiros: int
// x pertence aos inteiros -> retorna um r inteiro
method Triplo(x:int) returns (r:int)
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
