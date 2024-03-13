// RUN: %dafny /compile:3  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class C {
class C {
  constructor C() { }
  constructor C() { }
  method Main()  // not Main since the enclosing class has a constructor.
  {
    print "hello, I'm running ... in C\n";
  }
}

class D {
class D {
  method Main()  // not Main since it has modifies clause.
  {
    print "hello, I'm running ... in D\n";
  }
}


class E {
class E {
  static method Main()  // not Main since it has requires clause.
   requires true;
  {
    print "hello, I'm running ... in E\n";
  }
}

