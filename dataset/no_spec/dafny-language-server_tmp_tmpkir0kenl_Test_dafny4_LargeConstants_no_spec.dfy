// RUN: %dafny /compile:0 /dprint:"%t.dprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma largeIsLarge()
}

lemma SmallIsSmall()
}

lemma ShouldCancelOut()
}

