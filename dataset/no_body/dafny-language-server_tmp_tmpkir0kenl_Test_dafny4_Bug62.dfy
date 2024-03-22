// RUN: %dafny /compile:3  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class C {
  constructor C() { }
  method Main()  // not Main since the enclosing class has a constructor.
  {/* TODO */ }
}

class D {
  method Main()  // not Main since it has modifies clause.
   modifies this;
  {/* TODO */ }
}


class E {
  static method Main()  // not Main since it has requires clause.
   requires true;
  {/* TODO */ }
}

