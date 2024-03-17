// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function BitsAsInt(b:bv32): int
{
    b as int
}

