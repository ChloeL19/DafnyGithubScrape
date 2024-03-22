// RUN: %dafny /compile:3 "%s" > "%t"
// RUN: %dafny /compile:3 /optimize "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

class Class { }

newtype byte = x | 0 <= x < 256

datatype Record<G> = Make(0:Class?, 1:G, 2:Class, 3:int, 4:byte)

method Main()
{/* TODO */ }

method More(n: Class?)
{/* TODO */ }

method EvenMore(n: Class?)
{/* TODO */ }

method AndThenSome(n: Class?)
{/* TODO */ }

datatype CmpRecord<G> = Cmp(a: object?, g: G)

method Compare() {/* TODO */ }

method In() {/* TODO */ }

