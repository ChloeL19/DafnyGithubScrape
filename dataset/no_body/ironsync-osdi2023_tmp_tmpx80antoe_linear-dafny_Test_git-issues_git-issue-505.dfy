// RUN: %dafny /compile:0 /timeLimit:20 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma d()
{/* TODO */ }
lemma e()
{/* TODO */ }

// The longer bit vector operations currently timeout (because of Z3's
// inefficient support for bit-vector/int conversions),
// but the shorter bit width attempts verify OK

