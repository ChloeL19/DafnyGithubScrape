method Main()
{
    //conjunto vazio
    var s1: set<int> := {};
    var s2 := {1,2,3};

    //igualdade
    assert {1,2} == {2,1};
    assert {1,1,2} == {1,2};
    assert s2 != s1;

    //cardinalidade
    assert |s1| == 0;
    assert |s2| == 3;

    //pertence
    assert 1 in s2;
    assert 0 !in s1;

    //subconjunto
    assert {1} <= {1,2};
    assert {} < {1,2};
    assert {1,2} >= {1,2};
    assert {1,2} > {};

    //disjunção
    assert {1,2} !! {3,4};

    //uniao
    assert {1,2} + {2,3,4} == {1,2,3,4};

    //interseccao
    assert {1,2} * {2,3,4} == {2};

    //diferenca
    assert {1,2,3} - {1,2} == {3};



}
