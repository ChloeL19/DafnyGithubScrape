// RUN: /compile:1

abstract module Interface {
    type T
    function F(): T
    predicate P(x: T)
    lemma FP()
        ensures P(F())
}

module Implementation refines Interface {/* TODO */ }

abstract module User {
    import I : Interface

    lemma Main()
        ensures I.P(I.F());
    {/* TODO */ }
}

module Main refines User {
    import I = Implementation

    lemma Main()
        ensures I.P(I.F())
    {/* TODO */ }
}

