// RUN: %dafny /compile:4 /compileTarget:cs "%s" > "%t"
// RUN: %dafny /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

class F {
  var f: int;
  constructor (f: int) ensures this.f == f { this.f := f; }
}

