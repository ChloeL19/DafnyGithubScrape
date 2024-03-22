// RUN: %dafny /compile:3 "%s" /compileTarget:cs > "%t"
// RUN: %diff "%s.expect" "%t"

// The code in this file demonstrates complications in compiling to C# if a
// trait (like "object") is allowed as a type parameter to something compiled.
// The problem is that an assignment like a "set<MyClass>" to a "set<object>", which
// is allowed in Dafny, would require a deep copy in C#.  Another example is an
// assignment of a "MyDatatype<MyClass>" to a "MyDatatype<object>".
// Currently, the Dafny compiler enforces restrictions that rule out the expensive
// cases.  A possibly more friendly approach would be to emit code that performs
// the deep copies.
// Note that this is not a problem in JavaScript, which lacks type parameters.

method G()
{/* TODO */ }

trait Tr { var u: char }

class Class0 extends Tr { var x: int }

class Class1 extends Tr { var y: real }

datatype Dt<+A> = Atom(get: A)

method H() {/* TODO */ }

method I()
{/* TODO */ }

method J()
{/* TODO */ }

method Main()
{/* TODO */ }

