// RUN: %dafny /compile:3 /print:"%t.print" /env:0 /rprint:- "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype Handful = x | 0 <= x < 0x8000  // this type turns native
newtype Abundance = y | -20 <= y < 0x200_0000_0000  // still fits inside a "long"
newtype int64 = y | -0x8000_0000_0000_0000 <= y < 0x8000_0000_0000_0000  // exactly a "long"
newtype EvenInt = x | x % 2 == 0
newtype SmallReal = r | -4.0 <= r < 300.0

method Print(x: int, n: nat, r: real, handful: Handful, even: EvenInt, small: SmallReal, b67: bv67, w: bv32, seven: bv7, noll: bv0)
{/* TODO */ }

method PrintExpected<T>(got: T, expected: T) {/* TODO */ }

method Main()
{/* TODO */ }

method Difficult() {/* TODO */ }

method OrdinalTests() {/* TODO */ }

