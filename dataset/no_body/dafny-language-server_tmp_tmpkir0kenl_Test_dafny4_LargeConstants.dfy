// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma largeIsLarge()
  ensures 0x8000000000000000 > 0 {/* TODO */ }

lemma SmallIsSmall()
  ensures -0x8000000000000000 < 0 {/* TODO */ }

lemma ShouldCancelOut()
  ensures -0x8000000000000000 + 0x8000000000000000 == 0 {/* TODO */ }

