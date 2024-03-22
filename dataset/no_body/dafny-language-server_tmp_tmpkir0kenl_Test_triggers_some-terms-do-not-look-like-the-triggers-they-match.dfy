// RUN: %dafny /compile:0 /print:"%t.print" /dprint:"%t.dprint" /printTooltips "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

// This file shows how Dafny detects loops even for terms that are not literal
// AST matches. This file also checks that triggers are reported exactly as
// picked (that is, `x in s` yields `s[x]` for a multiset s), but matches as
// they appear in the buffer text (that is, `x+1 in s` is not translated to
// s[x+1] when highlited as a cause for a potential matching loop.

method M() {/* TODO */ }

