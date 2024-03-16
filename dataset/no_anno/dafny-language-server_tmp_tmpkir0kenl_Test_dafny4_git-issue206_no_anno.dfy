// RUN: %dafny /compile:0 /rprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype Foo = Bar(x: int)

method letTest() {
}

