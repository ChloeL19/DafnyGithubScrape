// RUN: %dafny "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

class Foo {}

trait InputStream {
  var x: int
  predicate Valid() reads this
  method read(b: Foo)
    requires Valid()
}

class ToyInputStream extends InputStream {/* TODO /* TODO */ }

