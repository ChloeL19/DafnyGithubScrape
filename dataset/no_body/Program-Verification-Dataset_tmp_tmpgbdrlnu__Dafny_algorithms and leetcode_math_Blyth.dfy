
function powerset<T(==)>(items: set<T>): set<set<T>> {
    set xs: set<T> | xs <= items
}

method one_one<T(==)>() {/* TODO */ }

/*
1.8 simplify
(A + (A + B)')' == (A+(A'*B'))' == ((A+A')*(A+B'))' == (A+A)'
*/
