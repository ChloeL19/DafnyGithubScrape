// Entendo como utilizar um Array no dafny
method Main()
{
    var a := new nat[4];
    a[0] := 0;
    print a[0]; //pode imprimir um valor
    // a[4] := 4; não pode porque vai de 0 á 3
}
