// UNSUPPORTED: windows
// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:py "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"
// The code in this file demonstrates complications in sorting out covariance in some
// compilation target languages.
//
// Part of the solution in Java is to use Java's wildcard types: a "Dafny.Sequence<T>"" is assignable to
// a "Dafny.Sequence<? extends T>".
//
// Covariance is not a problem in JavaScript, since JavaScript has no static types. It's also
// not a problem in Go, because Go has no type parameters and Dafny therefore encodes all
// type parameters as interface{}.

method G()
{/* TODO */ }

trait Tr { var u: char }

class Class0 extends Tr { var x: int }

class Class1 extends Tr { var y: real }

datatype Dt<+A> = Atom(get: A, more: int)

method H() {/* TODO */ }

method I()
{/* TODO */ }

method J()
{/* TODO */ }

method K()
{/* TODO */ }

method L()
{/* TODO */ }

method M()
{/* TODO */ }

method Downcast()
{/* TODO */ }

method Main()
{/* TODO */ }

