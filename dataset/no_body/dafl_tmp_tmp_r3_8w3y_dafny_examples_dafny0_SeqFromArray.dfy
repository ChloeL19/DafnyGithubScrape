// RUN: %dafny /compile:3 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// /autoTriggers:1 added to suppress instabilities

method Main() {/* TODO */ }

method H(a: array<int>, c: array<int>, n: nat, j: nat)
  requires j < n == a.Length == c.Length
{/* TODO */ }

method K(a: array<int>, c: array<int>, n: nat)
  requires n <= a.Length && n <= c.Length
{/* TODO */ }

method L(a: array<int>, c: array<int>, n: nat)
  requires n <= a.Length == c.Length
{/* TODO */ }

method M(a: array<int>, c: array<int>, m: nat, n: nat, k: nat, l: nat)
  requires k + m <= a.Length
  requires l + n <= c.Length
{/* TODO */ }

method M'(a: array<int>, c: array<int>, m: nat, n: nat, k: nat, l: nat)
  requires k + m <= a.Length
  requires l + n <= c.Length
{/* TODO */ }

