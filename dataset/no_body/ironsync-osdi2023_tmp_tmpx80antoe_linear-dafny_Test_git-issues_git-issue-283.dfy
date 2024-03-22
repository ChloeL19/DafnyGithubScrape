// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

datatype Result<T> =
  | Success(value: T)
  | Failure(error: string)

datatype C = C1 | C2(x: int)

trait Foo
{
  method FooMethod1(r: Result<()>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(()) => x := 1;
      case Failure(e) => x := 2;
    }
    assert x > 0;
    expect x == 1;
  }
  method FooMethod2(r: Result<C>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(C1()) => x := 1;
      case Success(C2(_)) => x := 2;
      case Failure(e) => x := 3;
    }
    assert x > 0;
    expect x == 1;
  }
  method FooMethod2q(r: Result<C>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(C1()) => x := 1;
      case Success(C2(x)) => x := 2;  // x is local variable
      case Failure(e) => x := 3;
    }
    assert x == 0 || x == 1 || x == 3;
    expect x == 0 || x == 1 || x == 3;
  }
  method FooMethod2r(r: Result<C>)
    ensures
      match r {/* TODO */ }
  {
    var x: real := 0.0;
    match r {
      case Success(C1()) => x := 1.0;
      case Success(C2(x)) => x := 2;  // x is local variable
      case Failure(e) => x := 3.0;
    }
    assert x == 0.0 || x == 1.0 || x == 3.0;
    expect x == 0.0 || x == 1.0 || x == 3.0;
  }
  method FooMethod3(r: Result<C>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(C1) => x := 1;
      case Success(C2(_)) => x := 2;  // BUG - problem if _ is x
      case Failure(e) => x := 3;
    }
    assert x > 0;
    expect x == 1;
  }
  method FooMethod4(r: Result<C>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(C2) => x := 1;
      case Failure(e) => x := 2;
    }
    assert x > 0;
    expect x == 1;
  }
  method FooMethod5(r: Result<string>)
    ensures
      match r {/* TODO */ }
  {
    var x: int := 0;
    match r {
      case Success(C1) => x := 1;
      case Failure(e) => x := 2;
    }
    assert x > 0;
    expect x == 1;
  }
}

class CL extends Foo {}

method Main() {/* TODO */ }

method m(t: Foo) {/* TODO */ }

