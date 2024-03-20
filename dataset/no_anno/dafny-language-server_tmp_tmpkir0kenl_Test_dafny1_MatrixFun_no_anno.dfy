// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method MirrorImage<T>(m: array2<T>)
  modifies m
{
  var a := 0;
  while a < m.Length0
  {
    var b := 0;
    while b < m.Length1 / 2
    {
      m[a, m.Length1-1-b], m[a, b] := m[a, b], m[a, m.Length1-1-b];
      b := b + 1;
    }
    a := a + 1;
  }
}

method Flip<T>(m: array2<T>)
{
  var N := m.Length0;
  var a := 0;
  var b := 1;
  while a != N
  {
    if b < N {
      m[a,b], m[b,a] := m[b,a], m[a,b];
      b := b + 1;
    } else {
      a := a + 1;  b := a + 1;
    }
  }
}

method Main()
{
  var B := new bool[2,5];
  B[0,0] := true;  B[0,1] := false;  B[0,2] := false;  B[0,3] := true;  B[0,4] := false;
  B[1,0] := true;  B[1,1] := true;   B[1,2] := true;   B[1,3] := true;  B[1,4] := false;
  print "Before:\n";
  PrintMatrix(B);
  MirrorImage(B);
  print "Mirror image:\n";
  PrintMatrix(B);

  var A := new int[3,3];
  A[0,0] := 5;  A[0,1] := 7;  A[0,2] := 9;
  A[1,0] := 6;  A[1,1] := 2;  A[1,2] := 3;
  A[2,0] := 7;  A[2,1] := 1;  A[2,2] := 0;
  print "Before:\n";
  PrintMatrix(A);
  Flip(A);
  print "Flip:\n";
  PrintMatrix(A);
}

method PrintMatrix<T>(m: array2<T>)
{
  var i := 0;
  while i < m.Length0 {
    var j := 0;
    while j < m.Length1 {
      print m[i,j];
      j := j + 1;
      if j == m.Length1 {
        print "\n";
      } else {
        print ", ";
      }
    }
    i := i + 1;
  }
}

