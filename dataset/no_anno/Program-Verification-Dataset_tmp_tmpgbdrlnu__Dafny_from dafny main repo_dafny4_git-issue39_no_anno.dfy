// RUN: %testDafnyForEachResolver "%s"


ghost function BitsAsInt(b:bv32): int
{
    b as int
}

