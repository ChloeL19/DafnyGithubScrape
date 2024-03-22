// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint8 = i:int | 0 <= i < 0x100
newtype uint32 = i:int | 0 <= i < 0x100000000

class C {
  var x:uint8;
}

method TestSeqOfClass() returns (s:seq<C>)
{/* TODO */ }

type fixed = t:seq<uint32> | |t| == 2 witness [0,0]

type buffer<T> = a:array?<T> | a == null || a.Length < 0x100000000
type buffer_t = buffer<uint8>

method BoundedLength(s:seq<uint8>)
  requires |s| < 10
{/* TODO */ }

method BufferTest(b:buffer_t)
  requires b != null
{/* TODO */ }

method Test(name:string, b:bool)
  requires b
{/* TODO */ }

method Print(s:string) {/* TODO */ }

method PrintTest() {/* TODO */ }

method Basic() {/* TODO */ }

method ValueEquality() {/* TODO */ }

method Contains() {/* TODO */ }

method Main() {/* TODO */ }

