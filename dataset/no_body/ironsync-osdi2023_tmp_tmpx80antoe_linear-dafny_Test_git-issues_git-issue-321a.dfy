// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

type lowercase = ch | 'a' <= ch <= 'z' witness 'd'

method InitTests() {/* TODO */ }


