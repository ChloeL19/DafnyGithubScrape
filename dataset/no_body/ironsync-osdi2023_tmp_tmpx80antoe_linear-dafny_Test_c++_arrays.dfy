// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint32 = i:int | 0 <= i < 0x100000000

method returnANullArray() returns (a: array?<uint32>)
  ensures a == null
{/* TODO */ }

method returnANonNullArray() returns (a: array?<uint32>)
  ensures a != null
  ensures a.Length == 5
{/* TODO */ }

method LinearSearch(a: array<uint32>, len:uint32, key: uint32) returns (n: uint32)
  requires a.Length == len as int
  ensures 0 <= n <= len
  ensures n == len || a[n] == key
{/* TODO */ }

method PrintArray<A>(a:array?<A>, len:uint32)
  requires a != null ==> len as int == a.Length
{/* TODO */ }

datatype ArrayDatatype = AD(ar: array<uint32>)

method Main() {/* TODO */ }



