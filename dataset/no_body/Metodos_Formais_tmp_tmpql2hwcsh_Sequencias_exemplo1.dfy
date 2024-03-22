// Exemplo utilizando sequencias
method Main()
{
    var a := new int[5];
    a[0] := 0;
    a[1] := 1;
    a[2] := 2;
    a[3] := 3;
    a[4] := 4;

    // A -> 0 | 1 | 2 | 3 | 4
    // S -> 0 | 1 | 2 | 3 | 4
    
    assert 5 !in a[..]; //verificar se o 5 pertence a sequencia do a

    var s := a[..]; // S copia todos os valores da sequencia a

    // verificando se funcionou os asserts no a
    assert a[..] == [0,1,2,3,4];
    assert a[1..3] == [1,2];
    assert a[2..] == [2,3,4];
    assert a[..2] == [0,1];
}
