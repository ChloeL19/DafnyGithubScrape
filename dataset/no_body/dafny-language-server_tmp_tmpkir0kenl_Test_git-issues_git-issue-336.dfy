// RUN: %dafny "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

lemma TestMap(a: map<int, (int,int)>) {/* TODO */ }

lemma TestSet0(a: set<int>) {/* TODO */ }

lemma TestSet1(a: set<int>, m: int) {/* TODO */ }

lemma TestSet2(a: set<int>, m: int)
  requires m in a && m < 7
{/* TODO */ }

