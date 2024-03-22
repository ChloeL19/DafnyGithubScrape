// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint64 = i:int | 0 <= i < 0x10000000000000000

class Test<T> {
  var t:T;

  constructor (e:T) {
    t := e;
  }
}

class UseTest<T> {
  constructor () {}
  method DoSomething(t:Test<T>)
  {/* TODO */ }
}


datatype Err<V> = Fail(b:bool) | Ok(value:V)
method ErrTest() returns (e:Err<bool>)
{/* TODO */ }

datatype Option<V> = None | Some(value:V)

method GenericIO<A>(a:A) returns (a':A)
{/* TODO */ }

method Main() {/* TODO */ }

