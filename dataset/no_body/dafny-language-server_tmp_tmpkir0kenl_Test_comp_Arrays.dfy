// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cs "%s" > "%t"
// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method LinearSearch(a: array<int>, key: int) returns (n: nat)
  ensures 0 <= n <= a.Length
  ensures n == a.Length || a[n] == key
{/* TODO */ }

method PrintArray<A>(a: array?<A>) {/* TODO */ }

method Main() {/* TODO */ }

type lowercase = ch | 'a' <= ch <= 'z' witness 'd'

method InitTests() {/* TODO */ }

method MultipleDimensions() {/* TODO */ }

method DiagMatrix<A>(rows: int, cols: int, zero: A, one: A)
    returns (a: array2<A>)
    requires rows >= 0 && cols >= 0
{/* TODO */ }

method PrintMatrix<A>(m: array2<A>) {/* TODO */ }

