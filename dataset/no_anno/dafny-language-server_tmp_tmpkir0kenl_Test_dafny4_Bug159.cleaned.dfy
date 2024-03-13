// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method ArrayInit(n: nat) returns (a: array<int>)
{
  a := new int[n];
  forall i | 0 <= i < n {
    a[i] := i;
  }
}

method Init(m: array2<int>)
{
  forall i,j | 0 <= i < m.Length0 && 0 <= j < m.Length1 {
    m[i,j] := 0;
  }
}

method Gradient(n: nat) returns (m: array2<int>)
{
  m := new int[n,n];
  forall i,j | 0 <= i < n && 0 <= j < n {
    m[i,j] := i+j;
  }
}

method M3(C: array3<real>)
{
  forall i,j,k | 0 <= i < C.Length0 && 0 <= j < C.Length1 && 0 <= k < C.Length2
  {
    C[i,j,k] := 0.0;
  }
}

