//tipo multiset<T>
//tipo valor imutável
//literal multiset{1,1,2,2,2,3}

method Main()
{
    var ms0:multiset<int> := multiset{};
    var ms1 := multiset{1,1,1,2};
    var ms2 := multiset{1,1};

    assert |ms1| == 4; //cardinalidade
    assert ms1[1] == 3; //número de ocorrências de um elemento

    assert 1 in ms1; //pertence
    assert 0 !in ms1; //não pertence

    assert ms1 == multiset{1,2,1,1}; //igualdade
    assert ms1 != multiset{}; //desigualdade

    assert ms1 !! multiset{3,3,4}; //disjuncao

    assert multiset{1,2} <= ms1; //subconjunto

    assert ms1 + ms2 == multiset{1,1,1,1,1,2}; //uniao
    assert ms1 - ms2 == multiset{1,2}; //diferenca
    assert ms1 * ms2 == multiset{1,1}; //interseccao

    assert ms1[2:=0] == multiset{1,1,1}; //alteracao
}
