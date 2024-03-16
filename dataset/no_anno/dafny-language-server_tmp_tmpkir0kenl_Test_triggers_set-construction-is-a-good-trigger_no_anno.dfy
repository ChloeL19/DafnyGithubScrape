// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file ensures that display expressions can be picked as triggers. This is
// useful for code that checks if a set, sequence, or multiset is a singleton.

method M(s: seq<int>, st: set<int>, mst: multiset<int>)
{
}

