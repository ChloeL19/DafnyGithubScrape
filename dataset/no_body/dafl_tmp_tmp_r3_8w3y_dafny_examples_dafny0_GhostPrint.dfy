// RUN: %dafny /dafnyVerify:0 /compile:0 /env:0 /dprint:"%t.dprint.dfy" "%s"
// RUN: %dafny /dafnyVerify:0 /compile:0 /env:0 "%t.dprint.dfy" > "%t"
// RUN: %diff "%s.expect" "%t"

method M() {/* TODO */ }

function F(): int { 5 }


