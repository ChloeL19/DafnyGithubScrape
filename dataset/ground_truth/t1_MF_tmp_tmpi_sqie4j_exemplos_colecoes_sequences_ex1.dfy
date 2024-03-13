//tipo seq<T>
//tipo valor imutável
//literal [1,2,3]

method Main()
{
    var vazia: seq<int> := []; //sequência vazia precisa especificar o tipo explicitamente
    var s := [1, 2, 3, 4, 5];
    
    assert seq(3, n => n*n) == [0,1,4]; //seq(k, função sobre n de 0 até k) "sequence comprehension"

    assert |s| == 5; //tamanho
    
    assert s[0] == 1; //indexacao
    
    assert s[1..3] == [2, 3]; //subsequência
    assert s[1..] == [2, 3, 4, 5]; //"drop"
    assert s[..4] == [1, 2, 3, 4]; //"take"
    
    assert [1,2,3] == [1] + [2,3]; //concatenacao

    assert s[2 := 6] == [1,2,6,4,5]; //alteracao

    assert 1 in s; //pertence
    assert 0 !in s; //nao pertence

    assert forall i :: i in s ==> 1 <= i < 6; //quantificador

    assert vazia < s;//prefixo
    assert [1,2] < s;
    assert [1,2,3,4,5] <= s;

    var t := [3.14, 2.7, 1.41, 1985.44, 100.0, 37.2][1:0:3]; //slices
    assert |t| == 3 && t[0] == [3.14] && t[1] == []; //resulta em uma seq de seq
    assert t[2] == [2.7, 1.41, 1985.44];
}
