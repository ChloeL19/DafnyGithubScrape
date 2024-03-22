// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

module Issue
{
  class Foo<T> {
    function Repr(): set<object> { {this} }
    constructor() {}
  }

  method UseFoo<T>(t: Foo<T>)
    modifies t.Repr()
  {/* TODO */ }

  method CallUseFoo<T>(t: Foo<T>)
    modifies t.Repr()
  {/* TODO */ }
}

// the following variation was working all along
module Variation {
  class Foo<T> {
    function Repr(): set<object> { {this} }
    constructor() {}
  }

  class UseFooHelper<T>
  {
    const foo: Foo<T>
    constructor(foo: Foo<T>)
      ensures this.foo == foo
    {
      this.foo := foo;
    }

    method Do()
      modifies foo.Repr()
    {/* TODO */ }
  }

  method CallUseFoo<T>(t: Foo<T>)
    modifies t.Repr()
  {/* TODO */ }
}

// the following variation was also working all along
module AnotherVariation
{
  class Foo<T> {
    function Repr(): set<object> { {this} }
    constructor() {}

    method UseFoo()
      modifies Repr()
    {/* TODO */ }
  }

  method CallUseFoo<T>(t: Foo<T>)
    modifies t.Repr()
  {/* TODO */ }
}

