// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cpp "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

newtype uint32 = i:int | 0 <= i < 0x100000000

method R0(x:bool)
{/* TODO */ }

method R1(y:bool)
{/* TODO */ }

method CallSelf(x:uint32) {/* TODO */ }

method Main() {/* TODO */ }

