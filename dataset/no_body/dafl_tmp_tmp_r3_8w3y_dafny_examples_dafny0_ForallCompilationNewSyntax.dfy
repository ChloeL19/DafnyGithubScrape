// RUN: %baredafny run %args --relax-definite-assignment --quantifier-syntax:4 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

class MyClass
{
  var arr: array2<int>

  method K0(i: int, j: int)
    requires 0 <= i < arr.Length0 && 0 <= j < arr.Length1
    modifies arr
  {/* TODO */ }

  method K1(i: int, j: int)
    requires 0 <= i < arr.Length0 && 0 <= j < arr.Length1
    // note the absence of a modifies clause
  {/* TODO */ }

  method K2(i: int, j: int)
    requires 0 <= i < arr.Length0 && 0 <= j < arr.Length1
    modifies arr
  {/* TODO */ }

  method K3(i: int, j: int)
    requires 0 <= i < arr.Length0 && 0 <= j < arr.Length1
    modifies arr
  {/* TODO */ }

  method K4(j: int)
    requires 0 <= j < arr.Length1
    modifies arr
  {/* TODO */ }

  method M()
  {/* TODO */ }

  method N() {/* TODO */ }

  method P() {/* TODO */ }

  method Q() {/* TODO */ }
}

