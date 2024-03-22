// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /compile:3 /spillTargetCode:3 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /compile:3 /spillTargetCode:3 /compileTarget:java "%s" >> "%t"
// RUN: %dafny /compile:3 /spillTargetCode:3 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /compile:3 /spillTargetCode:3 /compileTarget:go "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method pr<T>(s: seq<T>) {/* TODO */ }

method Main() {/* TODO */ }



