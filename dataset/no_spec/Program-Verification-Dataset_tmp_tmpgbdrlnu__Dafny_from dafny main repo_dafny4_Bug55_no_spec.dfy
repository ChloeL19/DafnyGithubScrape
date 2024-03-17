// RUN: %testDafnyForEachResolver "%s"


ghost predicate {:opaque} G(f:int~>bool)
{
  true
}

ghost predicate A<T>(s:set<T>)

predicate{:opaque} B(s:set<int>)
