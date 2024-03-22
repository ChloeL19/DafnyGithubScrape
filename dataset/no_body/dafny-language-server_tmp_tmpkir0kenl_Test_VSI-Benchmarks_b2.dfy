// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Benchmark2 {
  method BinarySearch(a: array<int>, key: int) returns (result: int)
    requires forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    ensures -1 <= result < a.Length;
    ensures 0 <= result ==> a[result] == key;
    ensures result == -1 ==> forall i :: 0 <= i < a.Length ==> a[i] != key;
  {/* TODO */ }
}

method Main() {/* TODO */ }

method TestSearch(a: array<int>, key: int)
  requires forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j];
{/* TODO */ }

