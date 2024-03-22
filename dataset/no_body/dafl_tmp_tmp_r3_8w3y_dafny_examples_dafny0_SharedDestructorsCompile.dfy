// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:py "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

datatype Dt =
  | A(x: int, y: real)
  | B(h: MyClass, x: int)
  | C(y: real)

class MyClass { }

method Main()
{/* TODO */ }

datatype Klef =
  | C0(0: int, 1: int, 2: int, c0: int)
  | C1(1: int, 2: int, 3: int, c1: int)
  | C2(2: int, 3: int, 0: int, c2: int)
  | C3(3: int, 0: int, 1: int, c3: int)

method BaseKlef(k: Klef)
  requires !k.C0? && !k.C2? && !k.C1?
{/* TODO */ }

datatype Datte<T> = AA(a: int, x: int) | BB(b: bool, x: int) | CC(c: real) | DD(x: int, o: set<int>, p: bv27, q: T)

method Matte(d: Datte<real>)
  requires !d.CC?
{/* TODO */ }

