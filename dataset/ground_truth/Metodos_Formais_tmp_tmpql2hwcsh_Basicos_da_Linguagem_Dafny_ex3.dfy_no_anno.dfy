// quero implementar uma função que calcula o valor absoluto de um numero
method Abs(x:int) returns (r:int)

// podemos colocar vários ensures, ele vai verificar se todos estão verdadeiros
// ==> é o então lógico
// se x é menor que zero, então r é igual ao x negativo (x < 0 ==> r == -x)
{
    if x < 0 { return -x; }
    else { return x;}
}
