// RUN: %dafny /compile:3 /print:"%t.print" /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// /autoTriggers:1 added to suppress instabilities

method Main() { }

method H(a: array<int>, c: array<int>, n: nat, j: nat)
{
  var A := a[..];
  var C := c[..];

  if {
    case A[j] == C[j] =>
  }
}

method K(a: array<int>, c: array<int>, n: nat)
{
  var A := a[..n];
  var C := c[..n];
  if {
    case A == C =>
  }
}

method L(a: array<int>, c: array<int>, n: nat)
{
  var A := a[n..];
  var C := c[n..];
  var h := a.Length - n;
  if {
    case A == C =>
  }
}

method M(a: array<int>, c: array<int>, m: nat, n: nat, k: nat, l: nat)
{
  var A := a[k..k+m];
  var C := c[l..l+n];
  if A == C {
    if * {
    } else if * {
    } else if * {
    } else if * {
    } else if * {
    } else if * {
    }
  }
}

method M'(a: array<int>, c: array<int>, m: nat, n: nat, k: nat, l: nat)
{
  if {
    case l+m <= c.Length && forall i :: 0 <= i < m ==> a[i] == c[l+i] =>
  }
}

