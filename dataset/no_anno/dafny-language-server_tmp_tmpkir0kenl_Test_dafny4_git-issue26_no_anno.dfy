// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function BitvectorCast(x:bv32): int
{
    x as int
}

