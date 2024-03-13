// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file ensures that `old()` receives the special treatment that it
// requires; that is, `old(f(x))` is not less liberal than `f(x)`, and
// old(f(f(x))) does not loop with f(x) (doesn't it?)

class C { }
class C { }
function f(c: C): C
function g(c: C): C
function h(c: C, i: int): C
method M(sc: set<C>)
{
}

