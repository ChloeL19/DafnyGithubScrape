// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file is a series of basic tests for loop detection, focusing on the
// warnings and information messages

function f(i: int): int
function g(i: int): int

method M() {/* TODO */ }

