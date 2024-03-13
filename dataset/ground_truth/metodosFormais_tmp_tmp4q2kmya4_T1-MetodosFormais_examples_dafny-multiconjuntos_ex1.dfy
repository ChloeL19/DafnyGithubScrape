method Main()
{
    var ms1: multiset<int> := multiset{};
    var ms2 := multiset{1,1,1,2,3};

    //cardinalidade
    assert |ms1| == 0;
    assert |ms2| == 5;
    assert ms2[1] == 3;

    //pertence
    assert 1 in ms2;
    assert 1 !in ms1;

    //igualdade
    assert ms1 == multiset{};
    assert multiset{1,2,3,1,1} == ms2;

    //subconjunto
    assert ms1 < ms2;
    assert multiset{1,2,1} <= ms2;

    //união
    assert multiset{1,1,1,2} + multiset{1,2} == multiset{1,1,1,1,2,2};
    //intersecção
    assert multiset{1,1,1,2} * multiset{1,2} == multiset{1,2};
    //diferença
    assert multiset{1,1,1,2} - multiset{1,2} == multiset{1,1};

    //disjunção --> Não possuem nenhum elemento em comum
    assert multiset{1,1} !! multiset{2,3,3};

    //alteração
    var ms3 := multiset{1,1,1,2,2,3};
    assert ms3[2:=0] == multiset{1,1,1,3};
}
