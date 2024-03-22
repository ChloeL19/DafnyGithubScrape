// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function foo(s:seq<int>) : (int, int)
{
  (0, 0)
}

method pop_run_impl() {/* TODO */ }
