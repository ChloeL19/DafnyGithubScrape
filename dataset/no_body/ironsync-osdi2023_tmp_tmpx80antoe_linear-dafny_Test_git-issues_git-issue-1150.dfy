// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype Foo = Foo(x: nat)
{
  // the following once generated malformed Boogie
  const good?: bool := 0 < x < 5;
}

method Main()
{/* TODO */ }

