// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file ensures that Dafny does get rid of redundant triggers before
// annotating a quantifier, and that ths process does not interfere with cycle
// detection.

function f(x: int): int
function g(x: int): int
function h(x: int): int
method M()
{
}

