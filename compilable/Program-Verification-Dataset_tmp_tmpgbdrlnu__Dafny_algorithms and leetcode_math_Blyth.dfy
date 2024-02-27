
function powerset<T(==)>(items: set<T>): set<set<T>> {
    set xs: set<T> | xs <= items
}

method one_one<T(==)>() {
    var A: set<set<set<set<T>>>> := {{},{{}},{{},{{}}}};
    assert {} <= A;
    assert {} in A;
    assert {{}} in A;
    assert {{}} <= A;
    assert {{{}}} <= A;
    assert {{{}}, {}} <= A;
    //The following should be true because ,assert {{},{{}}} == {{{}},{}};
    //assert {{{}}, {}} in A; //but dafny cannot prove it
    var test := {1,2};
    var pset := powerset(test);
    //assert pset == {{}, {1},{2},{1,2}};
    assert {} <= pset;
    assert {{1}} <= pset;
    assert {{2}} <= pset;
    assert {{1,2}} <= pset;
}

/*
1.8 simplify
(A + (A + B)')' == (A+(A'*B'))' == ((A+A')*(A+B'))' == (A+A)'
*/
