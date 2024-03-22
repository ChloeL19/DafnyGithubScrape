// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate p(i:int)

method m1()

method m2()
{/* TODO */ }

class Test
{
    var arr : array<int>;
    predicate p(i: int)
    method foo()
        requires arr.Length > 0
        modifies arr
    {/* TODO */ }
}

