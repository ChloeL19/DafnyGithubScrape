// Redo for exam

function gcd(a: nat, b: nat): nat

lemma r1(a: nat)
    ensures gcd(a, 0) == a

lemma r2(a:nat)
    ensures gcd(a, a) == a

lemma r3(a: nat, b: nat)
    ensures gcd(a, b) == gcd(b, a)

lemma r4 (a: nat, b: nat)
    ensures b > 0 ==> gcd(a, b) == gcd(b, a % b)

method GCD1(a: int, b: int) returns (r: int)
    requires a > 0 && b > 0
    ensures gcd(a,b) == r
    decreases b
{/* TODO */ }

method GCD2(a: int, b: int) returns (r: int)
    requires a > 0 && b >= 0
    decreases b
    ensures gcd(a,b) == r
{/* TODO */ }
