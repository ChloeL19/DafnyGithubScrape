method Main()
{
    var sequencia := [1,0,1];
    var multiconjunto_s := multiset(sequencia);
    assert multiconjunto_s == multiset{0,1,1};

    var conjunto := {1,0,1};
    var multiconjunto_c := multiset(conjunto);
    assert multiconjunto_c == multiset{0,1};
}
