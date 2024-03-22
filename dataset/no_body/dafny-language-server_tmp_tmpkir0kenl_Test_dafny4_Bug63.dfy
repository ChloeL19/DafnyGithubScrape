// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

method M()
  modifies set o: object | true
{/* TODO */ }

method Client()
{/* TODO */ }

