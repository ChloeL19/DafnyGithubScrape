// RUN: /compile:1

abstract module Interface {
    type T
    function F(): T
    predicate P(x: T)
    lemma FP()
module Implementation refines Interface {
    predicate P(x: T) {
    predicate P(x: T) {
        false
    }

}

abstract module User {
    import I : Interface

    lemma Main()
    {
        I.FP();
        assert I.P(I.F());
    }
}

module Main refines User {
    import I = Implementation

    lemma Main()
    {
        I.FP();
        assert false;
    }
}

