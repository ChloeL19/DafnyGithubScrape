// quero implementar uma função que calcula o valor absoluto de um numero
method Abs(x:int) returns (r:int)

// podemos colocar vários ensures, ele vai verificar se todos estão verdadeiros
// ==> é o então lógico
// se x é menor que zero, então r é igual ao x negativo (x < 0 ==> r == -x)
ensures r >= 0
ensures x < 0 ==> r == -x
ensures x >= 0 ==> r == x
// podemos colocar o && e || lógico 
ensures r >= 0 && (r == x || r == -x)

{
    if x < 0 { return -x; }
    else { return x;}
}
