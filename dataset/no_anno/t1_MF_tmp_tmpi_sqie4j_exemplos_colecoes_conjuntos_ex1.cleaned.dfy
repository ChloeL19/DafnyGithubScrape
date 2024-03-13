// tipo set<T>
// tipo valor imutável
// literal {1,2,3}

method Main()
{
    var s1:set<int> := {}; //conjunto vazio
    var s2 := {1,2,3};
    
    assert {1,1,2,2,2,3} == s2; //igualdade
    assert {1,2} == {2,1}; //igualdade
    assert {1,2} != {1}; //diferença

    assert |s1| == 0; //cardinalidade
    assert |s2| == 3;

    assert 1 in s2; //pertence
    assert 0 !in s2; //nao pertence

    var s3 := {1,2};
    var s4 := {3,4};
    assert s2 + s4 == {1,2,3,4}; //uniao
    assert s2 * s3 == {1,2}; //interseccao
    assert s2 - s3 == {3}; //diferenca

    assert {1} <= {1, 2}; //subconjunto
    assert {} < {1, 2}; //subconjunto próprio
    assert {1,2} >= {1}; //superconjunto
    assert {1,2} > {}; //superconjunto próprio
        
    assert s3 !! s4; //disjuncao
}
