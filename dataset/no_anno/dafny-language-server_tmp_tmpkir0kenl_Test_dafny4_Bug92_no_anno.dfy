// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"
module ModOpaque {
    function {:opaque} Hidden(x:int) : (int, int)
    {
        (5, 7)
    }

    function Visible(x:int) : (int, int)
    {
        Hidden(x)
    }

    lemma foo(x:int, y:int, z:int)
    {
    }

    lemma bar(x:int, y:int, z:int)
    {
    }

    lemma baz(x:int, y:int, z:int)
    {
    }
}

module ModVisible {
    function Hidden(x:int) : (int, int)
    {
        (5, 7)
    }

    function Visible(x:int) : (int, int)
    {
        Hidden(x)
    }

    lemma foo(x:int, y:int, z:int)
    {
    }

    lemma bar(x:int, y:int, z:int)
    {
    }

    lemma baz(x:int, y:int, z:int)
    {
    }
}

module ModFuel {
    function {:fuel 0,0} Hidden(x:int) : (int, int)
    {
        (5, 7)
    }

    function Visible(x:int) : (int, int)
    {
        Hidden(x)
    }

    lemma foo(x:int, y:int, z:int)
    {
    }

    lemma bar(x:int, y:int, z:int)
    {
    }

    lemma baz(x:int, y:int, z:int)
    {
    }
}
