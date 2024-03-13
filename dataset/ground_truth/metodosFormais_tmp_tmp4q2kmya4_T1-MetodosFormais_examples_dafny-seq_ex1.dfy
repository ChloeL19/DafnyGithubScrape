/*
Para todo i E Z (0<= i < A.len ==> A[i] != X)
X \E A
\E == não pertence

Sequências
SEQ<T> --> Uma coleção como uma lista. IMUTÁVEL
[1, 2, 3]
*/

method Main()
{
    var vazia: seq<int> := [];
    var s:seq<int> := [1, 2, 3, 4, 5];

    var itens: array<int>;
    itens := new int[3];
    itens[0] := 1;
    itens[1] := 2;
    itens[2] := 3;

    assert [1,2] == itens[..2];
    assert [1,2,3,4,5] == s[..];
    assert |s| == 5;
    assert s[0] == 1;
    assert s[1..3] == [2, 3];
    assert s[1..] == [2,3,4,5];
    assert s[..3] == [1,2,3];
    
    assert [1,2,2,3,4] == [1,2] + [2,3,4] ;

    assert 1 in s;
    assert 0 !in s;

    assert [1,2] + [3,4] == [1,2,3,4];

    assert vazia < s; //prefixo --> olha o conteúdo e não o tamanho.
    assert [1,2] < s;
    assert [1,2,3,4,5] <= s;

    assert s[2:=0] == [1,2,0,4,5]; // índice 2 coloca o valor 0. De resto é igual a S.
    assert s[2:=s[2]*2] == [1,2,6,4,5];
}

