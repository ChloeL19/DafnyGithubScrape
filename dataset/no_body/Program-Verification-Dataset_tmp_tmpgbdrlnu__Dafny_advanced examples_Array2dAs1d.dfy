// RUN: /compile:0 /nologo /rlimit:10000

lemma lemma_mul_le(x: int, y: int, z: int)
    requires 0 <= z
    requires x <= y
    ensures x * z <= y * z
{/* TODO */ }

method foo(input: array<int>, rows:int, cols:int)
requires input != null 
requires rows > 0 && cols > 0
requires rows * cols == input.Length
{/* TODO */ }

