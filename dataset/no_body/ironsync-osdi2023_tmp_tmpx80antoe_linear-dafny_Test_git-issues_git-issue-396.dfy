// RUN: %dafny /compile:4 /compileTarget:cs "%s" > "%t"
// RUN: %dafny /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

datatype Foo = Bar(value: int)

method GetValue(f: Foo) returns (i: int) {/* TODO */ }

method Main() {/* TODO */ }

