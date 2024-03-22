// RUN: /compile:0

newtype {:nativeType "uint"} u32 =
  x: int | 0 <= x < 0x100000000

function pow2(n: nat): int
{
  if n == 0 then 1 else 2 * pow2(n - 1)
}

lemma {:fuel pow2,31,32} {/* TODO */ } pow2Bounds(n: nat)
    requires n < 32
    ensures 0 <= pow2(n) < 0x100000000
{
}


function pow2u32(n: u32): u32
    requires n < 32
{
    pow2Bounds(n as nat);
    pow2(n as nat) as u32
}


/*lemma pow2Monotone(a: nat, b: nat)
    requires a < b
    ensures pow2(a) < pow2(b)
{/* TODO */ }

lemma pow2unroll2(n: nat)
    requires n >= 2
    ensures pow2(n) == 4 * pow2(n - 2)
{/* TODO */ }

lemma pow2unroll4(n: nat)
    requires n >= 4
    ensures pow2(n) == 0x10 * pow2(n - 4)
{/* TODO */ }

lemma pow2unroll8(n: nat)
    requires n >= 8
    ensures pow2(n) == 0x100 * pow2(n - 8)
{/* TODO */ }

lemma pow2unroll16(n: nat)
    requires n >= 16
    ensures pow2(n) == 0x10000 * pow2(n - 16)
{/* TODO */ }


lemma pow2Bounds(n: nat)
    requires n < 32
    ensures 0 <= pow2(n) < 0x100000000
{/* TODO */ }

lemma pow2Bounds'(n: nat)
    requires n < 32
    ensures 0 <= pow2(n) < 0x100000000
{/* TODO */ }

lemma pow2Bounds''(n: nat)
    requires n < 32
    ensures 0 <= pow2(n) < 0x100000000
{/* TODO */ }

lemma pow2Bounds'''(n: nat)
    requires n < 32
    ensures 0 <= pow2(n) < 0x100000000
{/* TODO */ }
*/

