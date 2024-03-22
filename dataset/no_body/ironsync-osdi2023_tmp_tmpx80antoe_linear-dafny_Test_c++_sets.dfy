// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint32 = i:int | 0 <= i < 0x100000000

datatype Example0 = Example0(u:uint32, b:bool)

method Test0(e0:Example0)
{/* TODO */ }

datatype Example1 = Ex1a(u:uint32) |  Ex1b(b:bool)
method Test1(t0:Example1)
{/* TODO */ }

method Test(name:string, b:bool)
  requires b
{/* TODO */ }

method Basic() {/* TODO */ }

method SetSeq() {/* TODO */ }

method SetComprehension(s:set<uint32>)
  requires forall i :: 0 <= i < 10 ==> i in s
  requires |s| == 10
{/* TODO */ }

method LetSuchThat() {/* TODO */ }

method Contains() {/* TODO */ }

method Main() {/* TODO */ }

