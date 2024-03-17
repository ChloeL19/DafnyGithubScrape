// RUN: %testDafnyForEachResolver "%s"


ghost function {:opaque} opfn(): int { 37 }

ghost function foo(): int
{
    var x := opfn();
}


