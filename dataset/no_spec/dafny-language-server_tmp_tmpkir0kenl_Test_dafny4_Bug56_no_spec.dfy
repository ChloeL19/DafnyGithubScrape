// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function I(f:int->bool):int->bool
{
    L1(b); // FAILS TO SATISFY L1's PRECONDITION
}
