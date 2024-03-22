// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method MirrorImage<T>(m: array2<T>)
  modifies m
  ensures forall i,j :: 0 <= i < m.Length0 && 0 <= j < m.Length1 ==>
            m[i,j] == old(m[i, m.Length1-1-j])
{/* TODO */ }

method Flip<T>(m: array2<T>)
  requires m.Length0 == m.Length1
  modifies m
  ensures forall i,j :: 0 <= i < m.Length0 && 0 <= j < m.Length1 ==> m[i,j] == old(m[j,i])
{/* TODO */ }

method Main()
{/* TODO */ }

method PrintMatrix<T>(m: array2<T>)
{/* TODO */ }

